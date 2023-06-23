# Signed-and-Unsigned-Carry-Save-Multiplier
Implementation of 4 Bit Carry Save Multiplier of both Signed and Unsigned Integers <br>
The Block Diagrams and optimized two's compliment method are reffered from lectures of Prof Janakiraman(IIT MADRAS) offered in the course of "Digital IC Design"
I recommend you to have a watch on carry save multipliers which are readilyy available on youtube.


Table of contents
=================

<!--ts-->
   * [INTRODUTION](https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier#introduction)
   * [BLOCK DIAGRAMS](https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier#block-diagrams)
       * [UNSIGNED VS SIGNED ](https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier#now-let-us-look-at-the-signed-carry-save-multiplier-implementation)
   * [RESULT](https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier#results)
     * [UNSIGNED MULTIPLICATION](https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier#unsigned-multiplier)
     * [SIGNED MULTIPLICATION](https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier#signed-and-unsigned-notation-comparsion-in-waveform)
 <!--te-->


 ## INTRODUCTION

 A carry-save multiplier is a type of digital multiplier circuit that is commonly used in computer arithmetic and digital signal processing applications. It is designed to perform high-speed multiplication of two binary numbers, typically represented as multi-bit binary words.

 The carry-save multiplier architecture involves three main components: the partial product generation stage, the partial product accumulation stage, and the final addition stage. In the partial product generation stage, the two input numbers are multiplied bit by bit, producing a set of partial products. These partial products are then accumulated in the partial product accumulation stage using a series of adders. 

The advantage of the carry-save multiplier lies in its high-speed operation. By postponing the carry propagation until the final stage, the critical path delay is minimized, enabling faster multiplication operations compared to other traditional multiplier designs. Additionally, carry-save multipliers are well-suited for parallel processing and can be easily scaled to accommodate larger word sizes.

However, one limitation of carry-save multipliers is their increased hardware complexity and resource utilization. They require additional adders and shifters, which can lead to higher circuit area and power consumption compared to simpler multiplier architectures. 

## BLOCK DIAGRAMS

The implementation of carry save multipliers considers the propogation of carry to preceding stage instead of rippling the carry in the same stage.
<br>

<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/79d0e421-637d-4810-9391-18646d44559d">
</p>


<br>

As seen from the block diagrsm the half adders and full adders compute parallely, thereby increasing the computational speed. <br>


## Now let us look at the Signed Carry Save Multiplier Implementation

In Signed Number, as Both Multiplier and Multiplicand are represented in 2's sompliment format, the MSB of both the multiplicand contains weightage 
of the sign ,If the MSB is 1 that means it is a negative number. <br>
<br>

<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/1d4d380d-9edf-4da0-b80a-73145e73f078">
</p>


<br>

So while generating partial products, all the products terms associated with that of the MSB of both multiplicand and multiplier must be taken 2's complimented 
during addition in fulladders/halfadders.
<br>
therefore adding the LSB 1's obtained during the compliment of a number beforehand results in 4(100) therefore 1 is added at the 3rd column of 1st row 
Similarly the complimentary 1's obtained at the LSB is added to the final full adder 
<br>

<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/73cf7a36-024a-4020-a4d8-99958c406674">
</p>



# RESULTS

I have written and provided the testcases for both of the signed and unsigned multipliers the same to compare the differences between the two
The tast case ensures that all possible multiplication of signs are seen, Such as (+ve x +ve) number , (-ve x -ve) number and (+ x -ve) finally
(-ve x +ve) numbers. <br>

## UNSIGNED MULTIPLIER 


OUTPUT AT TRANSCRIPT WINDOW :
<br>
<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/4ed13718-0522-4c09-accd-c5c54e9c229f"width=500 height=300>
</p>
<br>

### SIGNED AND UNSIGNED NOTATION COMPARSION IN WAVEFORM
<br>
Let us look the signed and unsigned notation in the waveform and compare the differences.

   <br>
<br>
<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/451e6bde-224e-49ea-99f0-9faebfa7e7ff">
</p>
<br>
<br>

<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/edc9ffdc-6054-4870-8010-81315c37a5aa">
</p>
<br>
  
As Seen From above waveforms the output is invalid for signed notations, Therefore the min and max values ranges(15 to 0) ie(2^n-1 to 0) so the multiplied values range from 255 to 0.
<br>



## SIGNED MULTIPLIER


OUTPUT AT TRANSCRIPT WINDOW :
<br>
<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/d69065c5-11b1-424a-9bc2-4653de930ff6"width=500 
    height= 300>
</p>
<br>

### SIGNED NOTATION IN WAVEFORM

<br>
<p align="center">
  <img src="https://github.com/Chetan-G-Gokhale/Signed-and-Unsigned-Carry-Save-Multiplier/assets/126239004/7054abae-29bd-4788-830d-7d3504f38241">
</p>

<br>

Therefore the implementation of Signed Number has Minimum and Maximum value ranging from (+7 to -8) ie (2^n-1 to -2^n) so multiplied max values is 64 to -64

