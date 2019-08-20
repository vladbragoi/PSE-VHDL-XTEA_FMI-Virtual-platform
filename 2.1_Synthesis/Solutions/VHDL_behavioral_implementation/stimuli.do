echo "Opening stimuli.do..."

restart -f

delete wave *
add wave *

# SOFT RESET
force clk 0 0 ns, 1 1 ns -repeat 2
force rst 1 0 ns, 0 6 ns
force mode 0 0 ns
force din_rdy 0 0 ns
run 6 ns

## ENCRYPTION
echo "Encryption starting..."

force word0 16#12345678 0 ns
force word1 16#9abcdeff 0 ns
force key0 01101010000111010111100011001000 0 ns
force key1 10001100100001101101011001111111 0 ns
force key2 00101010011001011011111110111110 0 ns
force key3 10110100101111010110111001000110 0 ns
force din_rdy 1 0 ns
force rst 1 0 ns
run 4 ns
#force din_rdy 0 0 ns
force rst 0 0 ns
run 500 ns

## DECRYPTION word0 = 10011001101110111011100100101011 (99bbb92b), word1 = 00111110101111010001011001000100 (3ebd1644)
echo "Decryption starting..."

force word0 16#99bbb92b 0 ns	
force word1 16#3ebd1644 0 ns
force key0 01101010000111010111100011001000 0 ns
force key1 10001100100001101101011001111111 0 ns
force key2 00101010011001011011111110111110 0 ns
force key3 10110100101111010110111001000110 0 ns
force din_rdy 1 0 ns
force rst 1 0 ns
run 4 ns
force din_rdy 0 0 ns
force rst 0 0 ns
run 500 ns