`default_nettype none

// Module: ALUdec
// Desc:   Sets the ALU operation
// Inputs:
//   opcode          : instruction opcode
//   funct           : funct3 field (for R-type / I-type instructions)
//   add_rshift_type : distinguishes ADD vs SUB, or SRL vs SRA
// Outputs:
//   ALUop           : selects the ALU operation

import opcode_pkg::*;
import alu_op_pkg::*;

module ALUdec (
  input  logic [6:0] opcode,
  input  logic [2:0] funct,
  input  logic       add_rshift_type,
  output alu_op_t    ALUop
);

  // Implement your ALU decoder here, then delete this comment
  always_comb begin
    case(opcode)
      OPC_NOOP: begin
        ALUop = ALU_XXX;
      end

      OPC_LUI: begin
        ALUop = ALU_COPY_B;
      end

      OPC_AUIPC: begin
        ALUop = ALU_ADD;
      end

      OPC_JAL: begin
        ALUop = ALU_ADD;
      end

      OPC_JALR: begin
        ALUop = ALU_ADD;
      end

      OPC_BRANCH: begin
        ALUop = ALU_ADD;
      end

      OPC_STORE: begin
        ALUop = ALU_ADD;
      end

      OPC_LOAD: begin
        ALUop = ALU_ADD;
      end

      OPC_ARI_RTYPE: begin
        case(funct)
          FNC_ADD_SUB: begin
            case(add_rshift_type)
              FNC2_ADD: begin
                ALUop = ALU_ADD;
              end

              FNC2_SUB: begin
                ALUop = ALU_SUB;
              end
            endcase
          end

          FNC_SLL: begin
            ALUop = ALU_SLL;
          end

          FNC_SLT: begin
            ALUop = ALU_SLT;
          end

          FNC_SLTU: begin
            ALUop = ALU_SLTU;
          end

          FNC_XOR: begin
            ALUop = ALU_XOR;
          end

          FNC_SRL_SRA: begin
            case(add_rshift_type)
              FNC2_SRL: begin
                ALUop = ALU_SRL;
              end

              FNC2_SRA: begin
                ALUop = ALU_SRA;
              end
            endcase
          end

          FNC_OR: begin
            ALUop = ALU_OR;
          end
          
          FNC_AND: begin
            ALUop = ALU_AND;
          end
        endcase
      end

      OPC_ARI_ITYPE: begin
        case(funct)
          FNC_ADD_SUB: begin
            case(add_rshift_type)
              FNC2_ADD: begin
                ALUop = ALU_ADD;
              end

              FNC2_SUB: begin
                ALUop = ALU_SUB;
              end
            endcase
          end

          FNC_SLL: begin
            ALUop = ALU_SLL;
          end

          FNC_SLT: begin
            ALUop = ALU_SLT;
          end

          FNC_SLTU: begin
            ALUop = ALU_SLTU;
          end

          FNC_XOR: begin
            ALUop = ALU_XOR;
          end

          FNC_SRL_SRA: begin
            case(add_rshift_type)
              FNC2_SRL: begin
                ALUop = ALU_SRL;
              end

              FNC2_SRA: begin
                ALUop = ALU_SRA;
              end
            endcase
          end

          FNC_OR: begin
            ALUop = ALU_OR;
          end
          
          FNC_AND: begin
            ALUop = ALU_AND;
          end
        endcase
      end

      OPC_CSR: begin
        case(funct)
          FNC_RW: begin
            ALUop = ALU_XXX;
          end

          FNC_RWI: begin
            ALUop = ALU_XXX;
          end

          default: ALUop = ALU_XXX;
        endcase
      end

      default: begin
            ALUop = ALU_XXX;
          end
    endcase
  end


endmodule
