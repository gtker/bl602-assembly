# RM = BL602 Reference Manual 1.2. See the Pine64 bl602-docs repo.

# Global Register base address. Page 23 of the RM.
.set GLB_BASE, 0x40000000
# GPIO 10 and 11 configuration. Page 36 of the RM.
.set GPIO_CFGCTL5_OFFSET, 0x114

# GPIO Output Register. Not described in RM.
.set GPIO_CFGCTL32_OFFSET, 0x188

# GPIO Output Enable register. Not described in RM.
.set GPIO_CFGCTL34_OFFSET, 0x190

# Bitset to set GP11FUNC to 11 (SWGPIO), Pullup to 1
# and rest to zero. Page 36 of the RM.
# GPIO11 are the 16 highest bits.
.set GPIO_BITSET_CFGCTL5, 0b0000101100010000 << 16

# Bitset for Output and Output Enable register. 11th bit = GPIO11.
# High enables the output.
.set GPIO_BITSET_OUTPUT_ENABLE, 1 << 11

# Low enables the LED because the GPIO sinks current.
.set GPIO_BITSET_OUTPUT, 0 << 11

.section .text

main:
    # la = Load Address
    # Can be used to compute an offset from address, 
    # but not used here.
    # Load GLB_BASE pointer into 'temporary1'
    # int* t1 = (int*) GLB_BASE;
    la t1, GLB_BASE

    # Load bitset for config control 5 into 'temporary2'
    # int t2 = GPIO_BITSET_CFGCTL5;
    la t2, GPIO_BITSET_CFGCTL5

    # sw = Store Word (32 bits)
    # Store 'temporary2' in GLB_BASE pointer, plus the
    # GPIO10/GPIO11 register offset.
    # *(t1 + GPIO_CFGCTL5_OFFSET) = t2;
    sw t2, GPIO_CFGCTL5_OFFSET(t1)

    # Load bitset for enabling GPIO11 into 'temporary2'.
    # t2 = GPIO_BITSET_OUTPUT_ENABLE; 
    la t2, GPIO_BITSET_OUTPUT_ENABLE

    # Store 'temporary2' in GLB_BASE pointer, plus the
    # Output Enable register offset.
    # *(t1 + GPIO_CFGCTL34_OFFSET) = t2;
    sw t2, GPIO_CFGCTL34_OFFSET(t1)

    # t2 = GPIO_BITSET_OUTPUT;
    # The bitset for output enable should not be used for
    # output.
    la t2, GPIO_BITSET_OUTPUT

# Loop label.
loop:

    # Store 'temporary2' in GLB_BASE pointer, plus the
    # Out register offset.
    # This is the bit you would switch in order to blink
    # LED.
    # *(t1 + GPIO_CFGCTL32_OFFSET) = t2;
    sw t2, GPIO_CFGCTL32_OFFSET(t1)

    # Unconditionally Jump to loop.
    # goto loop;
    j loop
