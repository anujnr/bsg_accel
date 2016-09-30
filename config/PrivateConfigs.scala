//see LICENSE for license
package rocketchip

import Chisel._
import uncore._
import rocket._
//import cde._
import cde.{Parameters, Field, Config, Knob, Dump, World, Ex, ViewSym}
import cde.Implicits._
import bsgAccel._

class BsgAccelConfig extends Config {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case WidthP => 64
      case Stages => Knob("stages")
      case FastMem => Knob("fast_mem")
      case BufferSram => Dump(Knob("buffer_sram"))
      case RoccMaxTaggedMemXacts => 32

      //Place to add more accelerator instantiations
      //For every new Accel, use an unused custom opcode and CoreName as per Verilog module name

      case BuildRoCC => Seq( 
                          RoccParameters(    
                            opcodes = OpcodeSet.custom0,
                            generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Sha3Accel" })))) ),
                          RoccParameters(
                            opcodes = OpcodeSet.custom1,
                            generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "AccumulatorExample" })))) ))
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
    case "multi_vt" => true
  }
}

class BsgAccelVLSIConfig extends Config(new BsgAccelConfig ++ new DefaultVLSIConfig)
class BsgAccelFPGAConfig extends Config(new BsgAccelConfig ++ new DefaultFPGAConfig) 
class BsgAccelCPPConfig extends Config(new BsgAccelConfig ++ new DefaultCPPConfig) 
