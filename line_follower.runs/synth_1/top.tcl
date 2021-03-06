# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
set_param chipscope.maxJobs 2
set_param synth.incrementalSynthesisCache C:/Users/Artifank/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-21968-Artifank-PC/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Artifank/line_follower/line_follower.cache/wt [current_project]
set_property parent.project_path C:/Users/Artifank/line_follower/line_follower.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part_repo_paths {C:/Users/Artifank/AppData/Roaming/Xilinx/Vivado/2019.1/xhub/board_store} [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/Artifank/line_follower/line_follower.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -vhdl2008 -library xil_defaultlib {
  C:/Users/Artifank/qtr_sensor_test/qtr_sensor_test.srcs/sources_1/new/ssd_ctrl.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/color_sens.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/numerize_sensors.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/pid_controller.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/qtr_sens.vhd
}
read_vhdl -library xil_defaultlib {
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/top.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/motor_ctrl.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/pwmv2.vhd
  C:/Users/Artifank/line_follower/line_follower.srcs/sources_1/new/qtr_senss.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Artifank/line_follower/line_follower.srcs/constrs_1/new/contraints.xdc
set_property used_in_implementation false [get_files C:/Users/Artifank/line_follower/line_follower.srcs/constrs_1/new/contraints.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
