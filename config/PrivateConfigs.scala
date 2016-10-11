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

class With1Accel extends Config {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case BuildRoCC => Seq( 
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom0,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel0" })))) ))
		}
	}
}

class With2Accel extends Config {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case BuildRoCC => Seq( 
                          	RoccParameters(    
                            	opcodes = OpcodeSet.custom0,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel0" })))) ),
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom1,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel1" })))) ))
		}
	}
}
class With3Accel extends Config {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case BuildRoCC => Seq( 
                          	RoccParameters(    
                            	opcodes = OpcodeSet.custom0,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel0" })))) ),
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom1,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel1" })))) ),
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom2,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel2" })))) ))
		}
	}
}

class With4Accel extends Config {
  override val topDefinitions:World.TopDefs = {
    (pname,site,here) => pname match {
      case BuildRoCC => Seq( 
                          	RoccParameters(    
                            	opcodes = OpcodeSet.custom0,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel0" })))) ),
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom1,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel1" })))) ),
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom2,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel2" })))) ),
                          	RoccParameters(
                            	opcodes = OpcodeSet.custom3,
                            	generator = (p: Parameters) => (Module(new RoCCBlackBoxWrapper()(p.alterPartial({ case CoreName => "Accel3" })))) ))
		}
	}
}
      //Place to add more accelerator instantiations
      //For every new Accel, use an unused custom opcode and CoreName as per Verilog module name

class Bsg1AccelVLSIConfig extends Config(new BsgAccelConfig ++ new DefaultVLSIConfig ++ new With1Accel)
class Bsg2AccelVLSIConfig extends Config(new BsgAccelConfig ++ new DefaultVLSIConfig ++ new With2Accel)
class Bsg3AccelVLSIConfig extends Config(new BsgAccelConfig ++ new DefaultVLSIConfig ++ new With3Accel)
class Bsg4AccelVLSIConfig extends Config(new BsgAccelConfig ++ new DefaultVLSIConfig ++ new With4Accel)

class Bsg1AccelCPPConfig extends Config(new BsgAccelConfig ++ new DefaultCPPConfig ++ new With1Accel)
class Bsg2AccelCPPConfig extends Config(new BsgAccelConfig ++ new DefaultCPPConfig ++ new With2Accel)
class Bsg3AccelCPPConfig extends Config(new BsgAccelConfig ++ new DefaultCPPConfig ++ new With3Accel)
class Bsg4AccelCPPConfig extends Config(new BsgAccelConfig ++ new DefaultCPPConfig ++ new With4Accel)

class Bsg1AccelFPGAConfig extends Config(new BsgAccelConfig ++ new DefaultFPGAConfig ++ new With1Accel)
class Bsg2AccelFPGAConfig extends Config(new BsgAccelConfig ++ new DefaultFPGAConfig ++ new With2Accel)
class Bsg3AccelFPGAConfig extends Config(new BsgAccelConfig ++ new DefaultFPGAConfig ++ new With3Accel)
class Bsg4AccelFPGAConfig extends Config(new BsgAccelConfig ++ new DefaultFPGAConfig ++ new With4Accel)

class HurricaneConfig extends Config(new With2Cores ++ new WithOneOrMaxChannels ++ new With8MemoryChannels ++ new WithL2Capacity256 ++ new DefaultL2VLSIConfig ++ new BsgAccelConfig ++ new With1Accel)


