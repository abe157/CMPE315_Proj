--
--Entity: chip
--Architecture: structural
-- Arthur: a157


library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity chip is
  
  port (
      cpu_add    : in  std_logic_vector(7 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	 : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(7 downto 0));
end chip;

architecture structural of chip is


component output_enable
  port (
    input : in std_logic_vector(7 downto 0);
    en : in std_logic;
    output : out std_logic_vector(7 downto 0));
end component;

component reg8
  port (
    input :  in std_logic_vector(7 downto 0);
    clk   :  in std_logic;
    output:  out std_logic_vector(7 downto 0));
end component;

component reg
	port (
		input	:	in std_logic;
		clk		:	in std_logic;
		output	:	out std_logic);
end component;
	
component state_machine
  port (

		clk : in std_logic;
		Read_Write : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Hit_Miss : in std_logic;
		Ca : in std_logic_vector(7 downto 0);

		Ma : out std_logic_vector(7 downto 0);
		Ma_En : out std_logic;
		Cd_En : out std_logic;
		Ca_En : out std_logic;
		Data_Sel : out std_logic;
		REN : out std_logic;
		WEN : out std_logic;
		Valid_Data : out std_logic;
		Busy : out std_logic;
		byte_out  : out std_logic_vector(1 downto 0));
end component;

component cache
  port (
	Ca_tag		: in std_logic_vector(2 downto 0);
	Write_data : in std_logic_vector(7 downto 0);
	RE		: in std_logic;
	WE		: in std_logic;
	Valid_data : in std_logic;
	Reset 	: in std_logic;
	block_in : in std_logic_vector(2 downto 0);
	byte_in	 : in std_logic_vector(1 downto 0);	
	
	
	Output	: out std_logic_vector(7 downto 0);
	Hit_Miss_Signal : out std_logic);
end component;

component mux8
  port (
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    sel : in std_logic;
    output : out std_logic_vector(7 downto 0));
end component;


	-- Parts
	for sm	: state_machine use entity work.state_machine(structural);
	for Rw_reg : reg use entity work.reg(structural);
	for Ca_reg, Cd_reg : reg8 use entity work.reg8(structural);
	for cash : cache use entity work.cache(structural);
	for out_mem, out_cpu : output_enable use entity work.output_enable(structural);
	for mux_1 : mux8 use entity work.mux8(structural);
	
	signal zero : std_logic := '0';
	signal one	: std_logic := '1';
	signal ca_en, ren, wen, valid_data, hit_miss, temp_ma_en, temp_rw, temp_sel, temp_cd_en : std_logic;
	signal temp_ca, temp_ma, temp_cd, temp_output : std_logic_vector(7 downto 0);
	signal data_in : std_logic_vector(7 downto 0);
	signal temp_byte : std_logic_vector(1 downto 0);
	
begin  -- structural

	--RW Register
	Rw_reg : reg port map(cpu_rd_wrn, ca_en, temp_rw);
	
	--CPU Address Register
	Ca_reg : reg8 port map(cpu_add, ca_en, temp_ca);
	Cd_reg : reg8 Port map(cpu_data, ca_en, temp_cd);
	
	--State machine					clk  rd/wr      start reset   hit/miss   ca         ma     ma_en      cd_en    ca_en   data_sel  ren  wen  valid_data  busy 
	sm	:	state_machine port map(clk, temp_rw, start, reset, hit_miss, temp_ca, temp_ma, temp_ma_en, temp_cd_en, ca_en,    temp_sel, ren, wen, valid_data, busy, temp_byte);
	
	--Cache                      ca_tag ,        wdata, RE, WE, valid_data,   Reset, block_in(2-0),       byte_in(1-0),       output(7-0), hit_miss
	cash :	cache port map( temp_ca(7 downto 5), data_in, ren, wen, valid_data, reset, temp_ca(4 downto 2), temp_byte, temp_output, hit_miss);
	
	--Data Mux
	mux_1 : mux8 port map(mem_data, temp_cd, temp_sel, data_in);
	
	

  --CPU & data output enable
  out_mem	:	output_enable port map(temp_ca, temp_ma_en, mem_add);  
  --out_mem	:	output_enable port map(temp_ma, one, mem_add); 
  
  out_cpu	:	output_enable port map(temp_output, temp_cd_en, cpu_data);
  mem_en <= temp_ma_en;
  
  -- mem_add(7 downto 0) <= temp_ma(7 downto 0);
  
  -- cpu_data(3 downto 0) <= data_in(3 downto 0);
  -- cpu_data(7 downto 6) <= temp_byte;
  -- cpu_data(5) <= wen;
  -- cpu_data(4) <= temp_cd(4);
 -- cpu_data(5 downto 0) <= temp_ca(5 downto 0);
  
  --mem_add(7)<= hit_miss;
  --mem_add(5 downto 0) <= temp_ma(5 downto 0);

end structural;
