# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/OneDrive/EECS 31L/Final/RISCV/RISCV.cache/wt} [current_project]
set_property parent.project_path {D:/OneDrive/EECS 31L/Final/RISCV/RISCV.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {d:/OneDrive/EECS 31L/Final/RISCV/RISCV.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  {D:/OneDrive/EECS 31L/Final/ALUController.sv}
  {D:/OneDrive/EECS 31L/Final/RISC-V.sv}
  {D:/OneDrive/EECS 31L/Final/adder.sv}
  {D:/OneDrive/EECS 31L/Final/alu.sv}
  {D:/OneDrive/EECS 31L/Final/controller.sv}
  {D:/OneDrive/EECS 31L/Final/datamemory.sv}
  {D:/OneDrive/EECS 31L/Final/datapath.sv}
  {D:/OneDrive/EECS 31L/Final/flopr.sv}
  {D:/OneDrive/EECS 31L/Final/imm_Gen.sv}
  {D:/OneDrive/EECS 31L/Final/instructionmemory.sv}
  {D:/OneDrive/EECS 31L/Final/mux2.sv}
  {D:/OneDrive/EECS 31L/Final/regfile.sv}
  {D:/OneDrive/EECS 31L/Final/seg_display.sv}
  {D:/OneDrive/EECS 31L/Final/basys3_wrapper.sv}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/OneDrive/EECS 31L/Final/const1.xdc}}
set_property used_in_implementation false [get_files {{D:/OneDrive/EECS 31L/Final/const1.xdc}}]


synth_design -top basys3_wrapper -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef basys3_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file basys3_wrapper_utilization_synth.rpt -pb basys3_wrapper_utilization_synth.pb"
