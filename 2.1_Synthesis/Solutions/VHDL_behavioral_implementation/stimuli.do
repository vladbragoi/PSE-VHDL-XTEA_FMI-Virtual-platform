echo "Opening stimuli.do..."

restart -f

delete wave *
add wave clk
add wave rst
add wave mode
add wave din_rdy
add wave dout_rdy
add wave -radix binary key0
add wave -radix binary key1
add wave -radix binary key2
add wave -radix binary key3
add wave -radix decimal k
add wave -radix binary key
add wave result0
add wave result1
add wave v0
add wave v1
add wave sum
add wave status
add wave next_status
add wave -radix decimal counter

force clk 0 0 ns, 1 1 ns -repeat 2
# SOFT RESET
force rst 1 0 ns, 0 6 ns
force mode 0 0 ns
force din_rdy 0 0 ns
run 6 ns

## ENCRYPTION
echo "Encryption starting..."

force word0 16#12345678 0 ns
force word1 16#9abcdeff 0 ns
force key0 2#01101010000111010111100011001000 0 ns
force key1 2#10001100100001101101011001111111 0 ns
force key2 2#00101010011001011011111110111110 0 ns
force key3 2#10110100101111010110111001000110 0 ns
force din_rdy 1 0 ns
force rst 1 0 ns
run 4 ns
#force din_rdy 0 0 ns
force rst 0 0 ns
run 600 ns

# SOFT RESET
force rst 1 0 ns, 0 6 ns
force mode 1 0 ns
force din_rdy 0 0 ns
run 6 ns

## DECRYPTION 
# word0 = 10011001101110111011100100101011 (99bbb92b)
# word1 = 00111110101111010001011001000100 (3ebd1644)
echo "Decryption starting..."

force word0 16#99bbb92b 0 ns	
force word1 16#3ebd1644 0 ns
force key0 2#01101010000111010111100011001000 0 ns
force key1 2#10001100100001101101011001111111 0 ns
force key2 2#00101010011001011011111110111110 0 ns
force key3 2#10110100101111010110111001000110 0 ns
force din_rdy 1 0 ns
force rst 1 0 ns
run 4 ns
#force din_rdy 0 0 ns
force rst 0 0 ns
run 600 ns