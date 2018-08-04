--
--  Copyright (C) 2018, AdaCore
--

--  This spec has been automatically generated from STM32F20x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.STM32.CRC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype IDR_IDR_Field is Interfaces.STM32.Byte;

   --  Independent data register
   type IDR_Register is record
      --  General-purpose 8-bit data register bits
      IDR           : IDR_IDR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24 := 16#0#;
   end record
     with Size => 32, Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      IDR           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CR_RESET_Field is Interfaces.STM32.Bit;

   --  Control register
   type CR_Register is record
      --  Write-only. reset bit
      RESET         : CR_RESET_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : Interfaces.STM32.UInt31 := 16#0#;
   end record
     with Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESET         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  cyclic redundancy check calculation unit
   type CRC_Peripheral is record
      --  Data register
      DR  : aliased Interfaces.STM32.UInt32 with Volatile_Full_Access;
      --  Independent data register
      IDR : aliased IDR_Register with Volatile_Full_Access;
      --  Control register
      CR  : aliased CR_Register with Volatile_Full_Access;
   end record
     with Volatile;

   for CRC_Peripheral use record
      DR  at 16#0# range 0 .. 31;
      IDR at 16#4# range 0 .. 31;
      CR  at 16#8# range 0 .. 31;
   end record;

   --  cyclic redundancy check calculation unit
   CRC_Periph : aliased CRC_Peripheral
     with Import, Address => System'To_Address (16#40023000#);

end Interfaces.STM32.CRC;
