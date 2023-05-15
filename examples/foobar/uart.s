	.file	"uart.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.srodata,"a"
	.align	2
	.type	AXI4_SYSTEM_CLOCK, @object
	.size	AXI4_SYSTEM_CLOCK, 4
AXI4_SYSTEM_CLOCK:
	.word	40000000
	.text
	.align	1
	.type	get_dev_bar, @function
get_dev_bar:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	sd	a0,-72(s0)
	mv	a5,a1
	mv	a4,a2
	sh	a5,-74(s0)
	mv	a5,a4
	sh	a5,-76(s0)
	ld	a5,-72(s0)
	lw	a5,8(a5)
	srliw	a5,a5,8
	sext.w	a5,a5
	sext.w	a5,a5
	andi	a5,a5,255
	sw	a5,-28(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L2
.L6:
	lw	a5,-20(s0)
	addi	a5,a5,64
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	ld	a5,24(a5)
	sd	a2,-64(s0)
	sd	a3,-56(s0)
	sd	a4,-48(s0)
	sd	a5,-40(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,32
	sext.w	a5,a5
	sw	a5,-20(s0)
	ld	a5,-64(s0)
	andi	a4,a5,768
	li	a5,512
	bne	a4,a5,.L8
	lhu	a5,-58(s0)
	lhu	a4,-74(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bne	a4,a5,.L4
	lhu	a5,-60(s0)
	lhu	a4,-76(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bne	a4,a5,.L4
	ld	a5,-48(s0)
	j	.L7
.L8:
	nop
.L4:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L2:
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L6
	li	a5,-1
.L7:
	mv	a0,a5
	ld	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	get_dev_bar, .-get_dev_bar
	.section	.srodata
	.align	2
	.type	UART_TX_FULL, @object
	.size	UART_TX_FULL, 4
UART_TX_FULL:
	.word	-2147483648
	.align	2
	.type	UART_RX_EMPTY, @object
	.size	UART_RX_EMPTY, 4
UART_RX_EMPTY:
	.word	-2147483648
	.align	2
	.type	GNSS_FLAG_ACC_READY, @object
	.size	GNSS_FLAG_ACC_READY, 4
GNSS_FLAG_ACC_READY:
	.word	-2147483648
	.align	2
	.type	GNSS_FLAG_WAS_COREPOCH, @object
	.size	GNSS_FLAG_WAS_COREPOCH, 4
GNSS_FLAG_WAS_COREPOCH:
	.word	1073741824
	.align	2
	.type	GNSS_FLAG_SYMBSYNC_SET, @object
	.size	GNSS_FLAG_SYMBSYNC_SET, 4
GNSS_FLAG_SYMBSYNC_SET:
	.word	536870912
	.align	2
	.type	GNSS_FLAG_PHASECORR, @object
	.size	GNSS_FLAG_PHASECORR, 4
GNSS_FLAG_PHASECORR:
	.word	268435456
	.align	2
	.type	GNSS_SETTINGS_SIGN_IF, @object
	.size	GNSS_SETTINGS_SIGN_IF, 4
GNSS_SETTINGS_SIGN_IF:
	.word	1073741824
	.align	2
	.type	GNSS_MISC_GPSSF_ENA, @object
	.size	GNSS_MISC_GPSSF_ENA, 4
GNSS_MISC_GPSSF_ENA:
	.word	1
	.align	2
	.type	GNSS_MISC_GLOSF_ENA, @object
	.size	GNSS_MISC_GLOSF_ENA, 4
GNSS_MISC_GLOSF_ENA:
	.word	2
	.align	2
	.type	GNSS_MISC_GPS_MAGN_OFF, @object
	.size	GNSS_MISC_GPS_MAGN_OFF, 4
GNSS_MISC_GPS_MAGN_OFF:
	.word	4
	.align	2
	.type	GNSS_MISC_GLO_MAGN_OFF, @object
	.size	GNSS_MISC_GLO_MAGN_OFF, 4
GNSS_MISC_GLO_MAGN_OFF:
	.word	8
	.align	2
	.type	FSE2_CONTROL_ENA, @object
	.size	FSE2_CONTROL_ENA, 4
FSE2_CONTROL_ENA:
	.word	-2147483648
	.align	2
	.type	FSE2_CONTROL_ADC, @object
	.size	FSE2_CONTROL_ADC, 4
FSE2_CONTROL_ADC:
	.word	1073741824
	.align	2
	.type	FSE2_REC_DISABLE, @object
	.size	FSE2_REC_DISABLE, 4
FSE2_REC_DISABLE:
	.word	536870912
	.align	2
	.type	FSE2_STATE_NXT_DOPLER, @object
	.size	FSE2_STATE_NXT_DOPLER, 4
FSE2_STATE_NXT_DOPLER:
	.word	2097152
	.align	2
	.type	FSE2_STATE_PROCESSING, @object
	.size	FSE2_STATE_PROCESSING, 4
FSE2_STATE_PROCESSING:
	.word	1048576
	.align	2
	.type	FSE2_STATE_SELCHAN, @object
	.size	FSE2_STATE_SELCHAN, 4
FSE2_STATE_SELCHAN:
	.word	524288
	.align	2
	.type	FSE2_STATE_WRITING, @object
	.size	FSE2_STATE_WRITING, 4
FSE2_STATE_WRITING:
	.word	262144
	.align	2
	.type	FSE2_STATE_WAIT_MS, @object
	.size	FSE2_STATE_WAIT_MS, 4
FSE2_STATE_WAIT_MS:
	.word	131072
	.align	2
	.type	FSE2_STATE_IDLE, @object
	.size	FSE2_STATE_IDLE, 4
FSE2_STATE_IDLE:
	.word	65536
	.align	2
	.type	PLIC_MODE_OFF, @object
	.size	PLIC_MODE_OFF, 4
PLIC_MODE_OFF:
	.zero	4
	.align	2
	.type	PLIC_MODE_HIGH_LEVEL, @object
	.size	PLIC_MODE_HIGH_LEVEL, 4
PLIC_MODE_HIGH_LEVEL:
	.word	1
	.align	2
	.type	PLIC_MODE_LOW_LEVEL, @object
	.size	PLIC_MODE_LOW_LEVEL, 4
PLIC_MODE_LOW_LEVEL:
	.word	2
	.align	2
	.type	PLIC_MODE_RISING_EDGE, @object
	.size	PLIC_MODE_RISING_EDGE, 4
PLIC_MODE_RISING_EDGE:
	.word	3
	.align	2
	.type	PLIC_MODE_FALLING_EDGE, @object
	.size	PLIC_MODE_FALLING_EDGE, 4
PLIC_MODE_FALLING_EDGE:
	.word	4
	.align	2
	.type	PLIC_MODE_DUAL_EDGE, @object
	.size	PLIC_MODE_DUAL_EDGE, 4
PLIC_MODE_DUAL_EDGE:
	.word	5
	.text
	.align	1
	.type	mpu_region_total, @function
mpu_region_total:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	zero,-24(s0)
 #APP
# 41 "maps/map_mpu.h" 1
	csrr a5, 0xBC4
# 0 "" 2
 #NO_APP
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,8
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	mpu_region_total, .-mpu_region_total
	.align	1
	.type	mpu_disable_region, @function
mpu_disable_region:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	sd	zero,-24(s0)
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	sb	a5,-23(s0)
	ld	a5,-24(s0)
	ori	a5,a5,128
	sd	a5,-24(s0)
	ld	a5,-24(s0)
 #APP
# 50 "maps/map_mpu.h" 1
	csrw 0xBC4, a5
# 0 "" 2
 #NO_APP
	nop
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	mpu_disable_region, .-mpu_disable_region
	.align	1
	.type	mpu_enable_region, @function
mpu_enable_region:
	addi	sp,sp,-80
	sd	s0,72(sp)
	addi	s0,sp,80
	mv	a5,a0
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	sd	a4,-80(s0)
	sw	a5,-52(s0)
	mv	a5,a3
	sw	a5,-56(s0)
	li	a5,-1024
	sd	a5,-24(s0)
	ld	a5,-80(s0)
	sd	a5,-32(s0)
	ld	a5,-64(s0)
 #APP
# 62 "maps/map_mpu.h" 1
	csrw 0xBC2, a5
# 0 "" 2
 #NO_APP
	ld	a5,-72(s0)
	srli	a5,a5,1
	sd	a5,-72(s0)
	j	.L13
.L14:
	ld	a5,-24(s0)
	slli	a5,a5,1
	sd	a5,-24(s0)
	ld	a5,-72(s0)
	srli	a5,a5,1
	sd	a5,-72(s0)
.L13:
	ld	a5,-72(s0)
	bne	a5,zero,.L14
	ld	a5,-24(s0)
 #APP
# 69 "maps/map_mpu.h" 1
	csrw 0xBC3, a5
# 0 "" 2
 #NO_APP
	sd	zero,-40(s0)
	lw	a5,-52(s0)
	andi	a5,a5,0xff
	sb	a5,-39(s0)
	ld	a5,-40(s0)
	ori	a5,a5,16
	sd	a5,-40(s0)
	lw	a5,-56(s0)
	andi	a5,a5,1
	andi	a5,a5,0xff
	andi	a5,a5,1
	slli	a5,a5,3
	ld	a4,-40(s0)
	andi	a4,a4,-9
	or	a5,a4,a5
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	ori	a5,a5,128
	sd	a5,-40(s0)
	j	.L15
.L19:
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,114
	bne	a4,a5,.L16
	ld	a5,-40(s0)
	ori	a5,a5,2
	sd	a5,-40(s0)
.L16:
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,119
	bne	a4,a5,.L17
	ld	a5,-40(s0)
	ori	a5,a5,1
	sd	a5,-40(s0)
.L17:
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,120
	bne	a4,a5,.L18
	ld	a5,-40(s0)
	ori	a5,a5,4
	sd	a5,-40(s0)
.L18:
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
.L15:
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L19
	ld	a5,-40(s0)
 #APP
# 88 "maps/map_mpu.h" 1
	csrw 0xBC4, a5
# 0 "" 2
 #NO_APP
	nop
	ld	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	mpu_enable_region, .-mpu_enable_region
	.align	1
	.globl	print_char
	.type	print_char, @function
print_char:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	li	a5,268500992
	sd	a5,-24(s0)
.L21:
	ld	a5,-24(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sw	a5,-32(s0)
	lw	a5,-32(s0)
	mv	a4,a5
	li	a5,-2147483648
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L21
	lw	a4,-36(s0)
	ld	a5,-24(s0)
	sw	a4,0(a5)
	li	a5,0
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	print_char, .-print_char
	.align	1
	.globl	print_uart
	.type	print_uart, @function
print_uart:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	mv	a5,a1
	sw	a5,-60(s0)
	li	a5,268500992
	sd	a5,-32(s0)
	sw	zero,-20(s0)
	j	.L24
.L25:
	ld	a5,-32(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sw	a5,-40(s0)
	lw	a5,-40(s0)
	mv	a4,a5
	li	a5,-2147483648
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L25
	lw	a5,-20(s0)
	ld	a4,-56(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sext.w	a4,a5
	ld	a5,-32(s0)
	sw	a4,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L24:
	lw	a4,-20(s0)
	lw	a5,-60(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L25
	nop
	nop
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	print_uart, .-print_uart
	.align	1
	.globl	print_uart_hex
	.type	print_uart_hex, @function
print_uart_hex:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	li	a5,268500992
	sd	a5,-32(s0)
	sw	zero,-24(s0)
	j	.L27
.L28:
	ld	a5,-32(s0)
	lw	a5,0(a5)
	sext.w	a5,a5
	sw	a5,-40(s0)
	lw	a5,-40(s0)
	mv	a4,a5
	li	a5,-2147483648
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L28
	li	a4,15
	lw	a5,-24(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	slliw	a5,a5,2
	sext.w	a5,a5
	ld	a4,-56(s0)
	sra	a5,a4,a5
	andi	a5,a5,0xff
	andi	a5,a5,15
	sb	a5,-33(s0)
	lbu	a5,-33(s0)
	andi	a4,a5,0xff
	li	a5,9
	bgtu	a4,a5,.L29
	lbu	a5,-33(s0)
	addiw	a5,a5,48
	sb	a5,-17(s0)
	j	.L30
.L29:
	lbu	a5,-33(s0)
	addiw	a5,a5,87
	sb	a5,-17(s0)
.L30:
	lbu	a5,-17(s0)
	sext.w	a4,a5
	ld	a5,-32(s0)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L27:
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,15
	ble	a4,a5,.L28
	nop
	nop
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	print_uart_hex, .-print_uart_hex
	.align	1
	.globl	printnum
	.type	printnum, @function
printnum:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	addi	s0,sp,128
	sd	a0,-104(s0)
	mv	a5,a1
	mv	a4,a3
	sw	a5,-108(s0)
	mv	a5,a2
	sw	a5,-112(s0)
	mv	a5,a4
	sw	a5,-116(s0)
	sw	zero,-20(s0)
.L34:
	lw	a5,-108(s0)
	ld	a4,-104(s0)
	remu	a3,a4,a5
	lw	a5,-20(s0)
	addiw	a4,a5,1
	sw	a4,-20(s0)
	andi	a4,a3,0xff
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-72(a5)
	lw	a5,-108(s0)
	ld	a4,-104(s0)
	bltu	a4,a5,.L42
	lw	a5,-108(s0)
	ld	a4,-104(s0)
	divu	a5,a4,a5
	sd	a5,-104(s0)
	j	.L34
.L42:
	nop
	j	.L35
.L36:
	lw	a5,-116(s0)
	mv	a0,a5
	call	print_char
.L35:
	lw	a5,-112(s0)
	addiw	a4,a5,-1
	sw	a4,-112(s0)
	lw	a4,-20(s0)
	sext.w	a4,a4
	blt	a4,a5,.L36
	j	.L37
.L40:
	lw	a5,-20(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-72(a5)
	sext.w	a4,a5
	lw	a5,-20(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	lbu	a5,-72(a5)
	mv	a3,a5
	li	a5,9
	bleu	a3,a5,.L38
	li	a5,87
	j	.L39
.L38:
	li	a5,48
.L39:
	addw	a5,a5,a4
	sext.w	a5,a5
	mv	a0,a5
	call	print_char
.L37:
	lw	a5,-20(s0)
	addiw	a4,a5,-1
	sw	a4,-20(s0)
	bgt	a5,zero,.L40
	nop
	nop
	ld	ra,120(sp)
	ld	s0,112(sp)
	addi	sp,sp,128
	jr	ra
	.size	printnum, .-printnum
	.ident	"GCC: () 10.2.0"
