//see LICENSE for license
//authors: Anuj Rao
package bsgAccel

//import Chisel.Implicits._
import Chisel._

import rocket._

import cde.{Parameters, Field, Ex, World, ViewSym, Knob, Dump, Config}
import cde.Implicits._

case object WidthP extends Field[Int]
case object Stages extends Field[Int]
case object FastMem extends Field[Boolean]
case object BufferSram extends Field[Boolean]

abstract class SimpleRoCC()(implicit p: Parameters) extends RoCC()(p)
{
  io.interrupt := Bool(false)
  io.autl.acquire.valid := Bool(false)
  io.autl.grant.ready := Bool(false)
  for(i <- 0 until p(RoccNPTWPorts)) io.ptw(i).req.valid := Bool(false)
}

class RoCCBlackBoxWrapper()(implicit p: Parameters) extends SimpleRoCC()(p) {
  val bb = Module(new RoCCBlackBox()(p))
  //bb.io <> io

  bb.io.cmd.valid  <> io.cmd.valid
  bb.io.cmd.ready <> io.cmd.ready
  bb.io.cmd.bits.inst.funct <> io.cmd.bits.inst.funct
  bb.io.cmd.bits.rs1 <> io.cmd.bits.rs1
  bb.io.cmd.bits.rs2 <> io.cmd.bits.rs2
  
  bb.io.cmd.bits.inst.rd <> io.cmd.bits.inst.rd
  
  bb.io.cmd.bits.inst.rs1 <> io.cmd.bits.inst.rs1
  bb.io.cmd.bits.inst.rs2 <> io.cmd.bits.inst.rs2
  bb.io.cmd.bits.inst.xd <> io.cmd.bits.inst.xd
  bb.io.cmd.bits.inst.xs1 <> io.cmd.bits.inst.xs1
  bb.io.cmd.bits.inst.xs2 <> io.cmd.bits.inst.xs2
  bb.io.cmd.bits.inst.opcode <> io.cmd.bits.inst.opcode

  bb.io.resp.ready <> io.resp.ready
  bb.io.resp.valid <> io.resp.valid
  bb.io.resp.bits.rd <> io.resp.bits.rd
  bb.io.resp.bits.data <> io.resp.bits.data

  bb.io.busy <> io.busy
  bb.io.s <> io.s
  bb.io.exception <> io.exception
  bb.io.host_id <> io.host_id

  bb.io.mem.req.valid      <> io.mem.req.valid
  bb.io.mem.req.ready      <> io.mem.req.ready
  bb.io.mem.req.bits.tag   <> io.mem.req.bits.tag
  bb.io.mem.req.bits.addr <> io.mem.req.bits.addr
  bb.io.mem.req.bits.cmd  <> io.mem.req.bits.cmd
  bb.io.mem.req.bits.typ  <> io.mem.req.bits.typ
  bb.io.mem.req.bits.data  <> io.mem.req.bits.data

  bb.io.mem.resp.valid     <> io.mem.resp.valid
  bb.io.mem.resp.bits.tag  <> io.mem.resp.bits.tag
  bb.io.mem.resp.bits.data := io.mem.resp.bits.data

  bb.io.mem.resp.bits.addr <> io.mem.resp.bits.addr
  bb.io.mem.resp.bits.cmd <> io.mem.resp.bits.cmd  
  bb.io.mem.resp.bits.typ <> io.mem.resp.bits.typ
  bb.io.mem.resp.bits.nack <> io.mem.resp.bits.nack
  bb.io.mem.resp.bits.replay <> io.mem.resp.bits.replay
  bb.io.mem.resp.bits.has_data <> io.mem.resp.bits.has_data
  bb.io.mem.resp.bits.data_word_bypass <> io.mem.resp.bits.data_word_bypass
  bb.io.mem.resp.bits.store_data <> io.mem.resp.bits.store_data

  bb.io.autl.acquire.ready <> io.autl.acquire.ready
  //bb.io.autl.acquire.valid <> io.autl.acquire.valid

  //bb.io.autl.grant.ready <> io.autl.grant.ready
  bb.io.autl.grant.valid <> io.autl.grant.valid
  //bb.io.autl.grant.bits <> io.autl.grant.bits
}

class RoCCBlackBox()(implicit p: Parameters) extends BlackBox {
  val io = new RoCCInterface
  debug(Reg(init = Bits(0)))
  io.cmd.ready := Bool(false)
  moduleName = p(CoreName)
}

class DefaultConfig() extends Config {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case WidthP => 64
      case Stages => Knob("stages")
      case FastMem => Knob("fast_mem")
      case BufferSram => Dump(Knob("buffer_sram"))
      //case "multi_vt" => Dump(Knob("multi_vt"))
    }
  }
  override val topConstraints:List[ViewSym=>Ex[Boolean]] = List(
    ex => ex(WidthP) === 64,
    ex => ex(Stages) >= 1 && ex(Stages) <= 4 && (ex(Stages)%2 === 0 || ex(Stages) === 1),
    ex => ex(FastMem) === ex(FastMem),
    ex => ex(BufferSram) === ex(BufferSram)
    //ex => ex[Boolean]("multi_vt") === ex[Boolean]("multi_vt")
  )
  override val knobValues:Any=>Any = {
    case "stages" => 1
    case "fast_mem" => true
    case "buffer_sram" => false
    //case "multi_vt" => true
  }
}
