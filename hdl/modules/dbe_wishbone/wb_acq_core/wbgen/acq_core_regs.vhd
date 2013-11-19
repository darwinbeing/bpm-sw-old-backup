---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for BPM FSM Acquisition registers
---------------------------------------------------------------------------------------
-- File           : acq_core_regs.vhd
-- Author         : auto-generated by wbgen2 from acq_core.wb
-- Created        : Tue Nov 19 19:27:00 2013
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE acq_core.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.acq_core_wbgen2_pkg.all;


entity acq_core_regs is
  port (
    rst_n_i                                  : in     std_logic;
    clk_sys_i                                : in     std_logic;
    wb_adr_i                                 : in     std_logic_vector(3 downto 0);
    wb_dat_i                                 : in     std_logic_vector(31 downto 0);
    wb_dat_o                                 : out    std_logic_vector(31 downto 0);
    wb_cyc_i                                 : in     std_logic;
    wb_sel_i                                 : in     std_logic_vector(3 downto 0);
    wb_stb_i                                 : in     std_logic;
    wb_we_i                                  : in     std_logic;
    wb_ack_o                                 : out    std_logic;
    wb_stall_o                               : out    std_logic;
    fs_clk_i                                 : in     std_logic;
    regs_i                                   : in     t_acq_core_in_registers;
    regs_o                                   : out    t_acq_core_out_registers
  );
end acq_core_regs;

architecture syn of acq_core_regs is

signal acq_core_ctl_fsm_start_acq_int           : std_logic      ;
signal acq_core_ctl_fsm_start_acq_int_delay     : std_logic      ;
signal acq_core_ctl_fsm_start_acq_sync0         : std_logic      ;
signal acq_core_ctl_fsm_start_acq_sync1         : std_logic      ;
signal acq_core_ctl_fsm_start_acq_sync2         : std_logic      ;
signal acq_core_ctl_fsm_stop_acq_int            : std_logic      ;
signal acq_core_ctl_fsm_stop_acq_int_delay      : std_logic      ;
signal acq_core_ctl_fsm_stop_acq_sync0          : std_logic      ;
signal acq_core_ctl_fsm_stop_acq_sync1          : std_logic      ;
signal acq_core_ctl_fsm_stop_acq_sync2          : std_logic      ;
signal acq_core_ctl_reserved1_int               : std_logic_vector(13 downto 0);
signal acq_core_ctl_fsm_acq_now_int             : std_logic      ;
signal acq_core_ctl_fsm_acq_now_sync0           : std_logic      ;
signal acq_core_ctl_fsm_acq_now_sync1           : std_logic      ;
signal acq_core_ctl_reserved2_int               : std_logic_vector(14 downto 0);
signal acq_core_sta_fsm_state_int               : std_logic_vector(2 downto 0);
signal acq_core_sta_fsm_state_lwb               : std_logic      ;
signal acq_core_sta_fsm_state_lwb_delay         : std_logic      ;
signal acq_core_sta_fsm_state_lwb_in_progress   : std_logic      ;
signal acq_core_sta_fsm_state_lwb_s0            : std_logic      ;
signal acq_core_sta_fsm_state_lwb_s1            : std_logic      ;
signal acq_core_sta_fsm_state_lwb_s2            : std_logic      ;
signal acq_core_sta_fsm_acq_done_sync0          : std_logic      ;
signal acq_core_sta_fsm_acq_done_sync1          : std_logic      ;
signal acq_core_sta_fc_trans_done_sync0         : std_logic      ;
signal acq_core_sta_fc_trans_done_sync1         : std_logic      ;
signal acq_core_sta_fc_full_sync0               : std_logic      ;
signal acq_core_sta_fc_full_sync1               : std_logic      ;
signal acq_core_sta_ddr3_trans_done_sync0       : std_logic      ;
signal acq_core_sta_ddr3_trans_done_sync1       : std_logic      ;
signal acq_core_trig_cfg_hw_trig_sel_int        : std_logic      ;
signal acq_core_trig_cfg_hw_trig_sel_sync0      : std_logic      ;
signal acq_core_trig_cfg_hw_trig_sel_sync1      : std_logic      ;
signal acq_core_trig_cfg_hw_trig_pol_int        : std_logic      ;
signal acq_core_trig_cfg_hw_trig_pol_sync0      : std_logic      ;
signal acq_core_trig_cfg_hw_trig_pol_sync1      : std_logic      ;
signal acq_core_trig_cfg_hw_trig_en_int         : std_logic      ;
signal acq_core_trig_cfg_hw_trig_en_sync0       : std_logic      ;
signal acq_core_trig_cfg_hw_trig_en_sync1       : std_logic      ;
signal acq_core_trig_cfg_sw_trig_en_int         : std_logic      ;
signal acq_core_trig_cfg_sw_trig_en_sync0       : std_logic      ;
signal acq_core_trig_cfg_sw_trig_en_sync1       : std_logic      ;
signal acq_core_trig_cfg_int_trig_sel_int       : std_logic_vector(1 downto 0);
signal acq_core_trig_cfg_int_trig_sel_swb       : std_logic      ;
signal acq_core_trig_cfg_int_trig_sel_swb_delay : std_logic      ;
signal acq_core_trig_cfg_int_trig_sel_swb_s0    : std_logic      ;
signal acq_core_trig_cfg_int_trig_sel_swb_s1    : std_logic      ;
signal acq_core_trig_cfg_int_trig_sel_swb_s2    : std_logic      ;
signal acq_core_trig_cfg_reserved_int           : std_logic_vector(9 downto 0);
signal acq_core_trig_cfg_int_trig_thres_int     : std_logic_vector(15 downto 0);
signal acq_core_trig_cfg_int_trig_thres_swb     : std_logic      ;
signal acq_core_trig_cfg_int_trig_thres_swb_delay : std_logic      ;
signal acq_core_trig_cfg_int_trig_thres_swb_s0  : std_logic      ;
signal acq_core_trig_cfg_int_trig_thres_swb_s1  : std_logic      ;
signal acq_core_trig_cfg_int_trig_thres_swb_s2  : std_logic      ;
signal acq_core_trig_dly_int                    : std_logic_vector(31 downto 0);
signal acq_core_trig_dly_swb                    : std_logic      ;
signal acq_core_trig_dly_swb_delay              : std_logic      ;
signal acq_core_trig_dly_swb_s0                 : std_logic      ;
signal acq_core_trig_dly_swb_s1                 : std_logic      ;
signal acq_core_trig_dly_swb_s2                 : std_logic      ;
signal acq_core_sw_trig_wr_int                  : std_logic      ;
signal acq_core_sw_trig_wr_int_delay            : std_logic      ;
signal acq_core_sw_trig_wr_sync0                : std_logic      ;
signal acq_core_sw_trig_wr_sync1                : std_logic      ;
signal acq_core_sw_trig_wr_sync2                : std_logic      ;
signal acq_core_shots_nb_int                    : std_logic_vector(15 downto 0);
signal acq_core_shots_nb_swb                    : std_logic      ;
signal acq_core_shots_nb_swb_delay              : std_logic      ;
signal acq_core_shots_nb_swb_s0                 : std_logic      ;
signal acq_core_shots_nb_swb_s1                 : std_logic      ;
signal acq_core_shots_nb_swb_s2                 : std_logic      ;
signal acq_core_shots_reserved_int              : std_logic_vector(15 downto 0);
signal acq_core_trig_pos_int                    : std_logic_vector(31 downto 0);
signal acq_core_trig_pos_lwb                    : std_logic      ;
signal acq_core_trig_pos_lwb_delay              : std_logic      ;
signal acq_core_trig_pos_lwb_in_progress        : std_logic      ;
signal acq_core_trig_pos_lwb_s0                 : std_logic      ;
signal acq_core_trig_pos_lwb_s1                 : std_logic      ;
signal acq_core_trig_pos_lwb_s2                 : std_logic      ;
signal acq_core_pre_samples_int                 : std_logic_vector(31 downto 0);
signal acq_core_pre_samples_swb                 : std_logic      ;
signal acq_core_pre_samples_swb_delay           : std_logic      ;
signal acq_core_pre_samples_swb_s0              : std_logic      ;
signal acq_core_pre_samples_swb_s1              : std_logic      ;
signal acq_core_pre_samples_swb_s2              : std_logic      ;
signal acq_core_post_samples_int                : std_logic_vector(31 downto 0);
signal acq_core_post_samples_swb                : std_logic      ;
signal acq_core_post_samples_swb_delay          : std_logic      ;
signal acq_core_post_samples_swb_s0             : std_logic      ;
signal acq_core_post_samples_swb_s1             : std_logic      ;
signal acq_core_post_samples_swb_s2             : std_logic      ;
signal acq_core_samples_cnt_int                 : std_logic_vector(31 downto 0);
signal acq_core_samples_cnt_lwb                 : std_logic      ;
signal acq_core_samples_cnt_lwb_delay           : std_logic      ;
signal acq_core_samples_cnt_lwb_in_progress     : std_logic      ;
signal acq_core_samples_cnt_lwb_s0              : std_logic      ;
signal acq_core_samples_cnt_lwb_s1              : std_logic      ;
signal acq_core_samples_cnt_lwb_s2              : std_logic      ;
signal acq_core_ddr3_start_addr_int             : std_logic_vector(31 downto 0);
signal ack_sreg                                 : std_logic_vector(9 downto 0);
signal rddata_reg                               : std_logic_vector(31 downto 0);
signal wrdata_reg                               : std_logic_vector(31 downto 0);
signal bwsel_reg                                : std_logic_vector(3 downto 0);
signal rwaddr_reg                               : std_logic_vector(3 downto 0);
signal ack_in_progress                          : std_logic      ;
signal wr_int                                   : std_logic      ;
signal rd_int                                   : std_logic      ;
signal allones                                  : std_logic_vector(31 downto 0);
signal allzeros                                 : std_logic_vector(31 downto 0);

begin
-- Some internal signals assignments. For (foreseen) compatibility with other bus standards.
  wrdata_reg <= wb_dat_i;
  bwsel_reg <= wb_sel_i;
  rd_int <= wb_cyc_i and (wb_stb_i and (not wb_we_i));
  wr_int <= wb_cyc_i and (wb_stb_i and wb_we_i);
  allones <= (others => '1');
  allzeros <= (others => '0');
-- 
-- Main register bank access process.
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      ack_sreg <= "0000000000";
      ack_in_progress <= '0';
      rddata_reg <= "00000000000000000000000000000000";
      acq_core_ctl_fsm_start_acq_int <= '0';
      acq_core_ctl_fsm_start_acq_int_delay <= '0';
      acq_core_ctl_fsm_stop_acq_int <= '0';
      acq_core_ctl_fsm_stop_acq_int_delay <= '0';
      acq_core_ctl_reserved1_int <= "00000000000000";
      acq_core_ctl_fsm_acq_now_int <= '0';
      acq_core_ctl_reserved2_int <= "000000000000000";
      acq_core_sta_fsm_state_lwb <= '0';
      acq_core_sta_fsm_state_lwb_delay <= '0';
      acq_core_sta_fsm_state_lwb_in_progress <= '0';
      acq_core_trig_cfg_hw_trig_sel_int <= '0';
      acq_core_trig_cfg_hw_trig_pol_int <= '0';
      acq_core_trig_cfg_hw_trig_en_int <= '0';
      acq_core_trig_cfg_sw_trig_en_int <= '0';
      acq_core_trig_cfg_int_trig_sel_int <= "00";
      acq_core_trig_cfg_int_trig_sel_swb <= '0';
      acq_core_trig_cfg_int_trig_sel_swb_delay <= '0';
      acq_core_trig_cfg_reserved_int <= "0000000000";
      acq_core_trig_cfg_int_trig_thres_int <= "0000000000000000";
      acq_core_trig_cfg_int_trig_thres_swb <= '0';
      acq_core_trig_cfg_int_trig_thres_swb_delay <= '0';
      acq_core_trig_dly_int <= "00000000000000000000000000000000";
      acq_core_trig_dly_swb <= '0';
      acq_core_trig_dly_swb_delay <= '0';
      acq_core_sw_trig_wr_int <= '0';
      acq_core_sw_trig_wr_int_delay <= '0';
      acq_core_shots_nb_int <= "0000000000000000";
      acq_core_shots_nb_swb <= '0';
      acq_core_shots_nb_swb_delay <= '0';
      acq_core_shots_reserved_int <= "0000000000000000";
      acq_core_trig_pos_lwb <= '0';
      acq_core_trig_pos_lwb_delay <= '0';
      acq_core_trig_pos_lwb_in_progress <= '0';
      acq_core_pre_samples_int <= "00000000000000000000000000000000";
      acq_core_pre_samples_swb <= '0';
      acq_core_pre_samples_swb_delay <= '0';
      acq_core_post_samples_int <= "00000000000000000000000000000000";
      acq_core_post_samples_swb <= '0';
      acq_core_post_samples_swb_delay <= '0';
      acq_core_samples_cnt_lwb <= '0';
      acq_core_samples_cnt_lwb_delay <= '0';
      acq_core_samples_cnt_lwb_in_progress <= '0';
      acq_core_ddr3_start_addr_int <= "00000000000000000000000000000000";
    elsif rising_edge(clk_sys_i) then
-- advance the ACK generator shift register
      ack_sreg(8 downto 0) <= ack_sreg(9 downto 1);
      ack_sreg(9) <= '0';
      if (ack_in_progress = '1') then
        if (ack_sreg(0) = '1') then
          ack_in_progress <= '0';
        else
          acq_core_ctl_fsm_start_acq_int <= acq_core_ctl_fsm_start_acq_int_delay;
          acq_core_ctl_fsm_start_acq_int_delay <= '0';
          acq_core_ctl_fsm_stop_acq_int <= acq_core_ctl_fsm_stop_acq_int_delay;
          acq_core_ctl_fsm_stop_acq_int_delay <= '0';
          acq_core_sta_fsm_state_lwb <= acq_core_sta_fsm_state_lwb_delay;
          acq_core_sta_fsm_state_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (acq_core_sta_fsm_state_lwb_in_progress = '1')) then
            rddata_reg(2 downto 0) <= acq_core_sta_fsm_state_int;
            acq_core_sta_fsm_state_lwb_in_progress <= '0';
          end if;
          acq_core_trig_cfg_int_trig_sel_swb <= acq_core_trig_cfg_int_trig_sel_swb_delay;
          acq_core_trig_cfg_int_trig_sel_swb_delay <= '0';
          acq_core_trig_cfg_int_trig_thres_swb <= acq_core_trig_cfg_int_trig_thres_swb_delay;
          acq_core_trig_cfg_int_trig_thres_swb_delay <= '0';
          acq_core_trig_dly_swb <= acq_core_trig_dly_swb_delay;
          acq_core_trig_dly_swb_delay <= '0';
          acq_core_sw_trig_wr_int <= acq_core_sw_trig_wr_int_delay;
          acq_core_sw_trig_wr_int_delay <= '0';
          acq_core_shots_nb_swb <= acq_core_shots_nb_swb_delay;
          acq_core_shots_nb_swb_delay <= '0';
          acq_core_trig_pos_lwb <= acq_core_trig_pos_lwb_delay;
          acq_core_trig_pos_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (acq_core_trig_pos_lwb_in_progress = '1')) then
            rddata_reg(31 downto 0) <= acq_core_trig_pos_int;
            acq_core_trig_pos_lwb_in_progress <= '0';
          end if;
          acq_core_pre_samples_swb <= acq_core_pre_samples_swb_delay;
          acq_core_pre_samples_swb_delay <= '0';
          acq_core_post_samples_swb <= acq_core_post_samples_swb_delay;
          acq_core_post_samples_swb_delay <= '0';
          acq_core_samples_cnt_lwb <= acq_core_samples_cnt_lwb_delay;
          acq_core_samples_cnt_lwb_delay <= '0';
          if ((ack_sreg(1) = '1') and (acq_core_samples_cnt_lwb_in_progress = '1')) then
            rddata_reg(31 downto 0) <= acq_core_samples_cnt_int;
            acq_core_samples_cnt_lwb_in_progress <= '0';
          end if;
        end if;
      else
        if ((wb_cyc_i = '1') and (wb_stb_i = '1')) then
          case rwaddr_reg(3 downto 0) is
          when "0000" => 
            if (wb_we_i = '1') then
              acq_core_ctl_fsm_start_acq_int <= wrdata_reg(0);
              acq_core_ctl_fsm_start_acq_int_delay <= wrdata_reg(0);
              acq_core_ctl_fsm_stop_acq_int <= wrdata_reg(1);
              acq_core_ctl_fsm_stop_acq_int_delay <= wrdata_reg(1);
              acq_core_ctl_reserved1_int <= wrdata_reg(15 downto 2);
              acq_core_ctl_fsm_acq_now_int <= wrdata_reg(16);
              acq_core_ctl_reserved2_int <= wrdata_reg(31 downto 17);
            end if;
            rddata_reg(0) <= '0';
            rddata_reg(1) <= '0';
            rddata_reg(15 downto 2) <= acq_core_ctl_reserved1_int;
            rddata_reg(16) <= acq_core_ctl_fsm_acq_now_int;
            rddata_reg(31 downto 17) <= acq_core_ctl_reserved2_int;
            ack_sreg(4) <= '1';
            ack_in_progress <= '1';
          when "0001" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              acq_core_sta_fsm_state_lwb <= '1';
              acq_core_sta_fsm_state_lwb_delay <= '1';
              acq_core_sta_fsm_state_lwb_in_progress <= '1';
            end if;
            rddata_reg(3) <= acq_core_sta_fsm_acq_done_sync1;
            rddata_reg(7 downto 4) <= regs_i.sta_reserved1_i;
            rddata_reg(8) <= acq_core_sta_fc_trans_done_sync1;
            rddata_reg(9) <= acq_core_sta_fc_full_sync1;
            rddata_reg(15 downto 10) <= regs_i.sta_reserved2_i;
            rddata_reg(16) <= acq_core_sta_ddr3_trans_done_sync1;
            rddata_reg(31 downto 17) <= regs_i.sta_reserved3_i;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when "0010" => 
            if (wb_we_i = '1') then
              acq_core_trig_cfg_hw_trig_sel_int <= wrdata_reg(0);
              acq_core_trig_cfg_hw_trig_pol_int <= wrdata_reg(1);
              acq_core_trig_cfg_hw_trig_en_int <= wrdata_reg(2);
              acq_core_trig_cfg_sw_trig_en_int <= wrdata_reg(3);
              acq_core_trig_cfg_int_trig_sel_int <= wrdata_reg(5 downto 4);
              acq_core_trig_cfg_int_trig_sel_swb <= '1';
              acq_core_trig_cfg_int_trig_sel_swb_delay <= '1';
              acq_core_trig_cfg_reserved_int <= wrdata_reg(15 downto 6);
              acq_core_trig_cfg_int_trig_thres_int <= wrdata_reg(31 downto 16);
              acq_core_trig_cfg_int_trig_thres_swb <= '1';
              acq_core_trig_cfg_int_trig_thres_swb_delay <= '1';
            end if;
            rddata_reg(0) <= acq_core_trig_cfg_hw_trig_sel_int;
            rddata_reg(1) <= acq_core_trig_cfg_hw_trig_pol_int;
            rddata_reg(2) <= acq_core_trig_cfg_hw_trig_en_int;
            rddata_reg(3) <= acq_core_trig_cfg_sw_trig_en_int;
            rddata_reg(5 downto 4) <= acq_core_trig_cfg_int_trig_sel_int;
            rddata_reg(15 downto 6) <= acq_core_trig_cfg_reserved_int;
            rddata_reg(31 downto 16) <= acq_core_trig_cfg_int_trig_thres_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0011" => 
            if (wb_we_i = '1') then
              acq_core_trig_dly_int <= wrdata_reg(31 downto 0);
              acq_core_trig_dly_swb <= '1';
              acq_core_trig_dly_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= acq_core_trig_dly_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0100" => 
            if (wb_we_i = '1') then
              acq_core_sw_trig_wr_int <= '1';
              acq_core_sw_trig_wr_int_delay <= '1';
            end if;
            rddata_reg(0) <= 'X';
            rddata_reg(1) <= 'X';
            rddata_reg(2) <= 'X';
            rddata_reg(3) <= 'X';
            rddata_reg(4) <= 'X';
            rddata_reg(5) <= 'X';
            rddata_reg(6) <= 'X';
            rddata_reg(7) <= 'X';
            rddata_reg(8) <= 'X';
            rddata_reg(9) <= 'X';
            rddata_reg(10) <= 'X';
            rddata_reg(11) <= 'X';
            rddata_reg(12) <= 'X';
            rddata_reg(13) <= 'X';
            rddata_reg(14) <= 'X';
            rddata_reg(15) <= 'X';
            rddata_reg(16) <= 'X';
            rddata_reg(17) <= 'X';
            rddata_reg(18) <= 'X';
            rddata_reg(19) <= 'X';
            rddata_reg(20) <= 'X';
            rddata_reg(21) <= 'X';
            rddata_reg(22) <= 'X';
            rddata_reg(23) <= 'X';
            rddata_reg(24) <= 'X';
            rddata_reg(25) <= 'X';
            rddata_reg(26) <= 'X';
            rddata_reg(27) <= 'X';
            rddata_reg(28) <= 'X';
            rddata_reg(29) <= 'X';
            rddata_reg(30) <= 'X';
            rddata_reg(31) <= 'X';
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0101" => 
            if (wb_we_i = '1') then
              acq_core_shots_nb_int <= wrdata_reg(15 downto 0);
              acq_core_shots_nb_swb <= '1';
              acq_core_shots_nb_swb_delay <= '1';
              acq_core_shots_reserved_int <= wrdata_reg(31 downto 16);
            end if;
            rddata_reg(15 downto 0) <= acq_core_shots_nb_int;
            rddata_reg(31 downto 16) <= acq_core_shots_reserved_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "0110" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              acq_core_trig_pos_lwb <= '1';
              acq_core_trig_pos_lwb_delay <= '1';
              acq_core_trig_pos_lwb_in_progress <= '1';
            end if;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when "0111" => 
            if (wb_we_i = '1') then
              acq_core_pre_samples_int <= wrdata_reg(31 downto 0);
              acq_core_pre_samples_swb <= '1';
              acq_core_pre_samples_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= acq_core_pre_samples_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "1000" => 
            if (wb_we_i = '1') then
              acq_core_post_samples_int <= wrdata_reg(31 downto 0);
              acq_core_post_samples_swb <= '1';
              acq_core_post_samples_swb_delay <= '1';
            end if;
            rddata_reg(31 downto 0) <= acq_core_post_samples_int;
            ack_sreg(3) <= '1';
            ack_in_progress <= '1';
          when "1001" => 
            if (wb_we_i = '1') then
            end if;
            if (wb_we_i = '0') then
              acq_core_samples_cnt_lwb <= '1';
              acq_core_samples_cnt_lwb_delay <= '1';
              acq_core_samples_cnt_lwb_in_progress <= '1';
            end if;
            ack_sreg(5) <= '1';
            ack_in_progress <= '1';
          when "1010" => 
            if (wb_we_i = '1') then
              acq_core_ddr3_start_addr_int <= wrdata_reg(31 downto 0);
            end if;
            rddata_reg(31 downto 0) <= acq_core_ddr3_start_addr_int;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when others =>
-- prevent the slave from hanging the bus on invalid address
            ack_in_progress <= '1';
            ack_sreg(0) <= '1';
          end case;
        end if;
      end if;
    end if;
  end process;
  
  
-- Drive the data output bus
  wb_dat_o <= rddata_reg;
-- State machine acquisition_start command (ignore on read)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.ctl_fsm_start_acq_o <= '0';
      acq_core_ctl_fsm_start_acq_sync0 <= '0';
      acq_core_ctl_fsm_start_acq_sync1 <= '0';
      acq_core_ctl_fsm_start_acq_sync2 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_ctl_fsm_start_acq_sync0 <= acq_core_ctl_fsm_start_acq_int;
      acq_core_ctl_fsm_start_acq_sync1 <= acq_core_ctl_fsm_start_acq_sync0;
      acq_core_ctl_fsm_start_acq_sync2 <= acq_core_ctl_fsm_start_acq_sync1;
      regs_o.ctl_fsm_start_acq_o <= acq_core_ctl_fsm_start_acq_sync2 and (not acq_core_ctl_fsm_start_acq_sync1);
    end if;
  end process;
  
  
-- State machine stop command (ignore on read)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.ctl_fsm_stop_acq_o <= '0';
      acq_core_ctl_fsm_stop_acq_sync0 <= '0';
      acq_core_ctl_fsm_stop_acq_sync1 <= '0';
      acq_core_ctl_fsm_stop_acq_sync2 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_ctl_fsm_stop_acq_sync0 <= acq_core_ctl_fsm_stop_acq_int;
      acq_core_ctl_fsm_stop_acq_sync1 <= acq_core_ctl_fsm_stop_acq_sync0;
      acq_core_ctl_fsm_stop_acq_sync2 <= acq_core_ctl_fsm_stop_acq_sync1;
      regs_o.ctl_fsm_stop_acq_o <= acq_core_ctl_fsm_stop_acq_sync2 and (not acq_core_ctl_fsm_stop_acq_sync1);
    end if;
  end process;
  
  
-- Reserved1
  regs_o.ctl_reserved1_o <= acq_core_ctl_reserved1_int;
-- Acquire data immediately and don't wait for any trigger (ignore on read)
-- synchronizer chain for field : Acquire data immediately and don't wait for any trigger (ignore on read) (type RW/RO, clk_sys_i <-> fs_clk_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.ctl_fsm_acq_now_o <= '0';
      acq_core_ctl_fsm_acq_now_sync0 <= '0';
      acq_core_ctl_fsm_acq_now_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_ctl_fsm_acq_now_sync0 <= acq_core_ctl_fsm_acq_now_int;
      acq_core_ctl_fsm_acq_now_sync1 <= acq_core_ctl_fsm_acq_now_sync0;
      regs_o.ctl_fsm_acq_now_o <= acq_core_ctl_fsm_acq_now_sync1;
    end if;
  end process;
  
  
-- Reserved2
  regs_o.ctl_reserved2_o <= acq_core_ctl_reserved2_int;
-- State machine status
-- asynchronous std_logic_vector register : State machine status (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_sta_fsm_state_lwb_s0 <= '0';
      acq_core_sta_fsm_state_lwb_s1 <= '0';
      acq_core_sta_fsm_state_lwb_s2 <= '0';
      acq_core_sta_fsm_state_int <= "000";
    elsif rising_edge(fs_clk_i) then
      acq_core_sta_fsm_state_lwb_s0 <= acq_core_sta_fsm_state_lwb;
      acq_core_sta_fsm_state_lwb_s1 <= acq_core_sta_fsm_state_lwb_s0;
      acq_core_sta_fsm_state_lwb_s2 <= acq_core_sta_fsm_state_lwb_s1;
      if ((acq_core_sta_fsm_state_lwb_s1 = '1') and (acq_core_sta_fsm_state_lwb_s2 = '0')) then
        acq_core_sta_fsm_state_int <= regs_i.sta_fsm_state_i;
      end if;
    end if;
  end process;
  
  
-- FSM acquisition status
-- synchronizer chain for field : FSM acquisition status (type RO/WO, fs_clk_i -> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_sta_fsm_acq_done_sync0 <= '0';
      acq_core_sta_fsm_acq_done_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_sta_fsm_acq_done_sync0 <= regs_i.sta_fsm_acq_done_i;
      acq_core_sta_fsm_acq_done_sync1 <= acq_core_sta_fsm_acq_done_sync0;
    end if;
  end process;
  
  
-- Reserved
-- External flow control transfer status
-- synchronizer chain for field : External flow control transfer status (type RO/WO, fs_clk_i -> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_sta_fc_trans_done_sync0 <= '0';
      acq_core_sta_fc_trans_done_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_sta_fc_trans_done_sync0 <= regs_i.sta_fc_trans_done_i;
      acq_core_sta_fc_trans_done_sync1 <= acq_core_sta_fc_trans_done_sync0;
    end if;
  end process;
  
  
-- External flow control FIFO full status
-- synchronizer chain for field : External flow control FIFO full status (type RO/WO, fs_clk_i -> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_sta_fc_full_sync0 <= '0';
      acq_core_sta_fc_full_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_sta_fc_full_sync0 <= regs_i.sta_fc_full_i;
      acq_core_sta_fc_full_sync1 <= acq_core_sta_fc_full_sync0;
    end if;
  end process;
  
  
-- Reserved
-- DDR3 transfer status
-- synchronizer chain for field : DDR3 transfer status (type RO/WO, fs_clk_i -> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_sta_ddr3_trans_done_sync0 <= '0';
      acq_core_sta_ddr3_trans_done_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_sta_ddr3_trans_done_sync0 <= regs_i.sta_ddr3_trans_done_i;
      acq_core_sta_ddr3_trans_done_sync1 <= acq_core_sta_ddr3_trans_done_sync0;
    end if;
  end process;
  
  
-- Reserved
-- Hardware trigger selection
-- synchronizer chain for field : Hardware trigger selection (type RW/RO, clk_sys_i <-> fs_clk_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.trig_cfg_hw_trig_sel_o <= '0';
      acq_core_trig_cfg_hw_trig_sel_sync0 <= '0';
      acq_core_trig_cfg_hw_trig_sel_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_cfg_hw_trig_sel_sync0 <= acq_core_trig_cfg_hw_trig_sel_int;
      acq_core_trig_cfg_hw_trig_sel_sync1 <= acq_core_trig_cfg_hw_trig_sel_sync0;
      regs_o.trig_cfg_hw_trig_sel_o <= acq_core_trig_cfg_hw_trig_sel_sync1;
    end if;
  end process;
  
  
-- Hardware trigger polarity
-- synchronizer chain for field : Hardware trigger polarity (type RW/RO, clk_sys_i <-> fs_clk_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.trig_cfg_hw_trig_pol_o <= '0';
      acq_core_trig_cfg_hw_trig_pol_sync0 <= '0';
      acq_core_trig_cfg_hw_trig_pol_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_cfg_hw_trig_pol_sync0 <= acq_core_trig_cfg_hw_trig_pol_int;
      acq_core_trig_cfg_hw_trig_pol_sync1 <= acq_core_trig_cfg_hw_trig_pol_sync0;
      regs_o.trig_cfg_hw_trig_pol_o <= acq_core_trig_cfg_hw_trig_pol_sync1;
    end if;
  end process;
  
  
-- Hardware trigger enable
-- synchronizer chain for field : Hardware trigger enable (type RW/RO, clk_sys_i <-> fs_clk_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.trig_cfg_hw_trig_en_o <= '0';
      acq_core_trig_cfg_hw_trig_en_sync0 <= '0';
      acq_core_trig_cfg_hw_trig_en_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_cfg_hw_trig_en_sync0 <= acq_core_trig_cfg_hw_trig_en_int;
      acq_core_trig_cfg_hw_trig_en_sync1 <= acq_core_trig_cfg_hw_trig_en_sync0;
      regs_o.trig_cfg_hw_trig_en_o <= acq_core_trig_cfg_hw_trig_en_sync1;
    end if;
  end process;
  
  
-- Software trigger enable
-- synchronizer chain for field : Software trigger enable (type RW/RO, clk_sys_i <-> fs_clk_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      regs_o.trig_cfg_sw_trig_en_o <= '0';
      acq_core_trig_cfg_sw_trig_en_sync0 <= '0';
      acq_core_trig_cfg_sw_trig_en_sync1 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_cfg_sw_trig_en_sync0 <= acq_core_trig_cfg_sw_trig_en_int;
      acq_core_trig_cfg_sw_trig_en_sync1 <= acq_core_trig_cfg_sw_trig_en_sync0;
      regs_o.trig_cfg_sw_trig_en_o <= acq_core_trig_cfg_sw_trig_en_sync1;
    end if;
  end process;
  
  
-- Channel selection for internal trigger
-- asynchronous std_logic_vector register : Channel selection for internal trigger (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_trig_cfg_int_trig_sel_swb_s0 <= '0';
      acq_core_trig_cfg_int_trig_sel_swb_s1 <= '0';
      acq_core_trig_cfg_int_trig_sel_swb_s2 <= '0';
      regs_o.trig_cfg_int_trig_sel_o <= "00";
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_cfg_int_trig_sel_swb_s0 <= acq_core_trig_cfg_int_trig_sel_swb;
      acq_core_trig_cfg_int_trig_sel_swb_s1 <= acq_core_trig_cfg_int_trig_sel_swb_s0;
      acq_core_trig_cfg_int_trig_sel_swb_s2 <= acq_core_trig_cfg_int_trig_sel_swb_s1;
      if ((acq_core_trig_cfg_int_trig_sel_swb_s2 = '0') and (acq_core_trig_cfg_int_trig_sel_swb_s1 = '1')) then
        regs_o.trig_cfg_int_trig_sel_o <= acq_core_trig_cfg_int_trig_sel_int;
      end if;
    end if;
  end process;
  
  
-- Reserved
  regs_o.trig_cfg_reserved_o <= acq_core_trig_cfg_reserved_int;
-- Threshold for internal trigger
-- asynchronous std_logic_vector register : Threshold for internal trigger (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_trig_cfg_int_trig_thres_swb_s0 <= '0';
      acq_core_trig_cfg_int_trig_thres_swb_s1 <= '0';
      acq_core_trig_cfg_int_trig_thres_swb_s2 <= '0';
      regs_o.trig_cfg_int_trig_thres_o <= "0000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_cfg_int_trig_thres_swb_s0 <= acq_core_trig_cfg_int_trig_thres_swb;
      acq_core_trig_cfg_int_trig_thres_swb_s1 <= acq_core_trig_cfg_int_trig_thres_swb_s0;
      acq_core_trig_cfg_int_trig_thres_swb_s2 <= acq_core_trig_cfg_int_trig_thres_swb_s1;
      if ((acq_core_trig_cfg_int_trig_thres_swb_s2 = '0') and (acq_core_trig_cfg_int_trig_thres_swb_s1 = '1')) then
        regs_o.trig_cfg_int_trig_thres_o <= acq_core_trig_cfg_int_trig_thres_int;
      end if;
    end if;
  end process;
  
  
-- Trigger delay value
-- asynchronous std_logic_vector register : Trigger delay value (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_trig_dly_swb_s0 <= '0';
      acq_core_trig_dly_swb_s1 <= '0';
      acq_core_trig_dly_swb_s2 <= '0';
      regs_o.trig_dly_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_dly_swb_s0 <= acq_core_trig_dly_swb;
      acq_core_trig_dly_swb_s1 <= acq_core_trig_dly_swb_s0;
      acq_core_trig_dly_swb_s2 <= acq_core_trig_dly_swb_s1;
      if ((acq_core_trig_dly_swb_s2 = '0') and (acq_core_trig_dly_swb_s1 = '1')) then
        regs_o.trig_dly_o <= acq_core_trig_dly_int;
      end if;
    end if;
  end process;
  
  
-- Software trigger (ignore on read)
-- pass-through field: Software trigger (ignore on read) in register: Software trigger
  regs_o.sw_trig_o <= wrdata_reg(31 downto 0);
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_sw_trig_wr_sync0 <= '0';
      acq_core_sw_trig_wr_sync1 <= '0';
      acq_core_sw_trig_wr_sync2 <= '0';
    elsif rising_edge(fs_clk_i) then
      acq_core_sw_trig_wr_sync0 <= acq_core_sw_trig_wr_int;
      acq_core_sw_trig_wr_sync1 <= acq_core_sw_trig_wr_sync0;
      acq_core_sw_trig_wr_sync2 <= acq_core_sw_trig_wr_sync1;
      regs_o.sw_trig_wr_o <= acq_core_sw_trig_wr_sync1 and (not acq_core_sw_trig_wr_sync2);
    end if;
  end process;
  
  
-- Number of shots
-- asynchronous std_logic_vector register : Number of shots (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_shots_nb_swb_s0 <= '0';
      acq_core_shots_nb_swb_s1 <= '0';
      acq_core_shots_nb_swb_s2 <= '0';
      regs_o.shots_nb_o <= "0000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_shots_nb_swb_s0 <= acq_core_shots_nb_swb;
      acq_core_shots_nb_swb_s1 <= acq_core_shots_nb_swb_s0;
      acq_core_shots_nb_swb_s2 <= acq_core_shots_nb_swb_s1;
      if ((acq_core_shots_nb_swb_s2 = '0') and (acq_core_shots_nb_swb_s1 = '1')) then
        regs_o.shots_nb_o <= acq_core_shots_nb_int;
      end if;
    end if;
  end process;
  
  
-- Reserved
  regs_o.shots_reserved_o <= acq_core_shots_reserved_int;
-- Trigger address
-- asynchronous std_logic_vector register : Trigger address (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_trig_pos_lwb_s0 <= '0';
      acq_core_trig_pos_lwb_s1 <= '0';
      acq_core_trig_pos_lwb_s2 <= '0';
      acq_core_trig_pos_int <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_trig_pos_lwb_s0 <= acq_core_trig_pos_lwb;
      acq_core_trig_pos_lwb_s1 <= acq_core_trig_pos_lwb_s0;
      acq_core_trig_pos_lwb_s2 <= acq_core_trig_pos_lwb_s1;
      if ((acq_core_trig_pos_lwb_s1 = '1') and (acq_core_trig_pos_lwb_s2 = '0')) then
        acq_core_trig_pos_int <= regs_i.trig_pos_i;
      end if;
    end if;
  end process;
  
  
-- Pre-trigger samples
-- asynchronous std_logic_vector register : Pre-trigger samples (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_pre_samples_swb_s0 <= '0';
      acq_core_pre_samples_swb_s1 <= '0';
      acq_core_pre_samples_swb_s2 <= '0';
      regs_o.pre_samples_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_pre_samples_swb_s0 <= acq_core_pre_samples_swb;
      acq_core_pre_samples_swb_s1 <= acq_core_pre_samples_swb_s0;
      acq_core_pre_samples_swb_s2 <= acq_core_pre_samples_swb_s1;
      if ((acq_core_pre_samples_swb_s2 = '0') and (acq_core_pre_samples_swb_s1 = '1')) then
        regs_o.pre_samples_o <= acq_core_pre_samples_int;
      end if;
    end if;
  end process;
  
  
-- Post-trigger samples
-- asynchronous std_logic_vector register : Post-trigger samples (type RW/RO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_post_samples_swb_s0 <= '0';
      acq_core_post_samples_swb_s1 <= '0';
      acq_core_post_samples_swb_s2 <= '0';
      regs_o.post_samples_o <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_post_samples_swb_s0 <= acq_core_post_samples_swb;
      acq_core_post_samples_swb_s1 <= acq_core_post_samples_swb_s0;
      acq_core_post_samples_swb_s2 <= acq_core_post_samples_swb_s1;
      if ((acq_core_post_samples_swb_s2 = '0') and (acq_core_post_samples_swb_s1 = '1')) then
        regs_o.post_samples_o <= acq_core_post_samples_int;
      end if;
    end if;
  end process;
  
  
-- Samples counter
-- asynchronous std_logic_vector register : Samples counter (type RO/WO, fs_clk_i <-> clk_sys_i)
  process (fs_clk_i, rst_n_i)
  begin
    if (rst_n_i = '0') then 
      acq_core_samples_cnt_lwb_s0 <= '0';
      acq_core_samples_cnt_lwb_s1 <= '0';
      acq_core_samples_cnt_lwb_s2 <= '0';
      acq_core_samples_cnt_int <= "00000000000000000000000000000000";
    elsif rising_edge(fs_clk_i) then
      acq_core_samples_cnt_lwb_s0 <= acq_core_samples_cnt_lwb;
      acq_core_samples_cnt_lwb_s1 <= acq_core_samples_cnt_lwb_s0;
      acq_core_samples_cnt_lwb_s2 <= acq_core_samples_cnt_lwb_s1;
      if ((acq_core_samples_cnt_lwb_s1 = '1') and (acq_core_samples_cnt_lwb_s2 = '0')) then
        acq_core_samples_cnt_int <= regs_i.samples_cnt_i;
      end if;
    end if;
  end process;
  
  
-- DDR3 Start Address
  regs_o.ddr3_start_addr_o <= acq_core_ddr3_start_addr_int;
  rwaddr_reg <= wb_adr_i;
  wb_stall_o <= (not ack_sreg(0)) and (wb_stb_i and wb_cyc_i);
-- ACK signal generation. Just pass the LSB of ACK counter.
  wb_ack_o <= ack_sreg(0);
end syn;
