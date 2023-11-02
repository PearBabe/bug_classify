/*
 Navicat Premium Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : fuzz

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 02/11/2023 21:47:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classifybug
-- ----------------------------
DROP TABLE IF EXISTS `classifybug`;
CREATE TABLE `classifybug`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bug_report` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `predict_bug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `classifybug_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classifybug
-- ----------------------------
INSERT INTO `classifybug` VALUES (7, '.usercopy: Kernel memory exposure attempt detected from SLUB object \'skbuff_head_cache\' (offset 168, size 4)! \r\nkernel BUG at \r\nInternal error: Oops - BUG:  [#1] PREEMPT SMP \r\nModules linked in: \r\nCPU: 0 PID: 4410 Comm: syz-executor533 Not tainted 6.2.0-rc7-syzkaller-17907-g2d3827b3f393 #0 \r\nHardware name: Google Google Compute \r\npc : usercopy_abort\r\nlr : usercopy_abort\r\nsp :  \r\nx29:  x28:  x27:  \r\nx26:  x25:  x24:  \r\nx23:  x22:  x21:  \r\nx20:  x19:  x18:  \r\nx17:  x16:  x15:  \r\nx14:  x13:  x12:  \r\nx11:  x10:  x9 :  \r\nx8 :  x7 :  x6 :  \r\nx5 :  x4 :  x3 :  \r\nx2 :  x1 :  x0 :  \r\nusercopy_abort\r\n__check_heap_object\r\ncheck_heap_object \r\n__check_object_size\r\ncheck_object_size \r\n__copy_to_user \r\nput_cmsg\r\nsock_recv_mark \r\n__sock_recv_cmsgs\r\nsock_recv_cmsgs \r\npacket_recvmsg\r\n____sys_recvmsg\r\n___sys_recvmsg \r\n__sys_recvmsg\r\n__do_sys_recvmsg \r\n__se_sys_recvmsg \r\n__arm64_sys_recvmsg\r\n__invoke_syscall \r\ninvoke_syscall\r\nel0_svc_common\r\ndo_el0_svc\r\nel0_svc\r\nel0t_64_sync_handler\r\nel0t_64_sync', 'hardening io-uring mm ', '2023-05-14 01:00:28', 10);
INSERT INTO `classifybug` VALUES (8, '.usercopy: Kernel memory exposure attempt detected from SLUB object \'skbuff_head_cache\' (offset 168, size 4)! \r\nkernel BUG at \r\nInternal error: Oops - BUG:  [#1] PREEMPT SMP \r\nModules linked in: \r\nCPU: 0 PID: 4410 Comm: syz-executor533 Not tainted 6.2.0-rc7-syzkaller-17907-g2d3827b3f393 #0 \r\nHardware name: Google Google Compute \r\npc : usercopy_abort\r\nlr : usercopy_abort\r\nsp :  \r\nx29:  x28:  x27:  \r\nx26:  x25:  x24:  \r\nx23:  x22:  x21:  \r\nx20:  x19:  x18:  \r\nx17:  x16:  x15:  \r\nx14:  x13:  x12:  \r\nx11:  x10:  x9 :  \r\nx8 :  x7 :  x6 :  \r\nx5 :  x4 :  x3 :  \r\nx2 :  x1 :  x0 :  \r\nusercopy_abort\r\n__check_heap_object\r\ncheck_heap_object \r\n__check_object_size\r\ncheck_object_size \r\n__copy_to_user \r\nput_cmsg\r\nsock_recv_mark \r\n__sock_recv_cmsgs\r\nsock_recv_cmsgs \r\npacket_recvmsg\r\n____sys_recvmsg\r\n___sys_recvmsg \r\n__sys_recvmsg\r\n__do_sys_recvmsg \r\n__se_sys_recvmsg \r\n__arm64_sys_recvmsg\r\n__invoke_syscall \r\ninvoke_syscall\r\nel0_svc_common\r\ndo_el0_svc\r\nel0_svc\r\nel0t_64_sync_handler\r\nel0t_64_sync', 'hardening io-uring mm ', '2023-05-14 01:00:49', 10);
INSERT INTO `classifybug` VALUES (18, '.usercopy: Kernel memory exposure attempt detected from SLUB object \'skbuff_head_cache\' (offset 168, size 4)! \r\nkernel BUG at \r\nInternal error: Oops - BUG:  [#1] PREEMPT SMP \r\nModules linked in: \r\nCPU: 0 PID: 4410 Comm: syz-executor533 Not tainted 6.2.0-rc7-syzkaller-17907-g2d3827b3f393 #0 \r\nHardware name: Google Google Compute \r\npc : usercopy_abort\r\nlr : usercopy_abort\r\nsp :  \r\nx29:  x28:  x27:  \r\nx26:  x25:  x24:  \r\nx23:  x22:  x21:  \r\nx20:  x19:  x18:  \r\nx17:  x16:  x15:  \r\nx14:  x13:  x12:  \r\nx11:  x10:  x9 :  \r\nx8 :  x7 :  x6 :  \r\nx5 :  x4 :  x3 :  \r\nx2 :  x1 :  x0 :  \r\nusercopy_abort\r\n__check_heap_object\r\ncheck_heap_object \r\n__check_object_size\r\ncheck_object_size \r\n__copy_to_user \r\nput_cmsg\r\nsock_recv_mark \r\n__sock_recv_cmsgs\r\nsock_recv_cmsgs \r\npacket_recvmsg\r\n____sys_recvmsg\r\n___sys_recvmsg \r\n__sys_recvmsg\r\n__do_sys_recvmsg \r\n__se_sys_recvmsg \r\n__arm64_sys_recvmsg\r\n__invoke_syscall \r\ninvoke_syscall\r\nel0_svc_common\r\ndo_el0_svc\r\nel0_svc\r\nel0t_64_sync_handler\r\nel0t_64_sync', 'hardening io-uring mm ', '2023-05-14 02:56:11', 10);
INSERT INTO `classifybug` VALUES (19, '.general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] PREEMPT SMP KASAN \r\nKASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027] \r\nCPU: 0 PID: 10041 Comm: syz-executor.0 Not tainted 6.2.0-rc2-syzkaller-00388-g55b98837e37d #0 \r\nHardware name: Google Google Compute \r\nnetdev_run_todo\r\nieee80211_register_hw\r\nmac80211_hwsim_new_radio\r\nhwsim_new_radio_nl\r\ngenl_family_rcv_msg_doit.isra.0\r\ngenl_family_rcv_msg \r\ngenl_rcv_msg\r\nnetlink_rcv_skb\r\ngenl_rcv\r\nnetlink_unicast_kernel \r\nnetlink_unicast\r\nnetlink_sendmsg\r\nsock_sendmsg_nosec \r\nsock_sendmsg\r\n____sys_sendmsg\r\n___sys_sendmsg\r\n__sys_sendmsg\r\ndo_syscall_x64 \r\ndo_syscall_64\r\nentry_SYSCALL_64_after_hwframe\r\n', 'net ', '2023-05-14 02:58:33', 8);
INSERT INTO `classifybug` VALUES (20, 'PROC_DEV:into open!\r\nBUG: KASAN: slab-out-of-bounds in instrument_copy_from_user include/linux/instrumented.h:135 [inline]\r\nBUG: KASAN: slab-out-of-bounds in _copy_from_user+0x41/0xa0 lib/usercopy.c:15\r\nWrite of size 4096 at addr ffff888004177c00 by task syz-executor/3706\r\nPROC_DEV:into open!\r\nCPU: 0 PID: 3706 Comm: syz-executor Not tainted 5.14.0 #2\r\nHardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014\r\nCall Trace:\r\n __dump_stack lib/dump_stack.c:88 [inline]\r\n dump_stack_lvl+0x4d/0x66 lib/dump_stack.c:105\r\n print_address_description.constprop.0+0x21/0x140 mm/kasan/report.c:233\r\n __kasan_report mm/kasan/report.c:419 [inline]\r\n kasan_report.cold+0x7f/0x11b mm/kasan/report.c:436\r\n check_region_inline mm/kasan/generic.c:183 [inline]\r\n kasan_check_range+0x17c/0x1e0 mm/kasan/generic.c:189\r\n instrument_copy_from_user include/linux/instrumented.h:135 [inline]\r\n _copy_from_user+0x41/0xa0 lib/usercopy.c:15\r\n copy_from_user include/linux/uaccess.h:192 [inline]\r\n proc_test_write+0x4a/0x70 drivers/char/test.c:46\r\n pde_write fs/proc/inode.c:335 [inline]\r\n proc_reg_write+0x1df/0x260 fs/proc/inode.c:347\r\n vfs_write fs/read_write.c:603 [inline]\r\n vfs_write+0x199/0x720 fs/read_write.c:585\r\n ksys_write+0x100/0x210 fs/read_write.c:658\r\n do_syscall_x64 arch/x86/entry/common.c:50 [inline]\r\n do_syscall_64+0x3b/0x90 arch/x86/entry/common.c:80\r\n entry_SYSCALL_64_after_hwframe+0x44/0xae\r\nRIP: 0033:0x7fbf99f9d6fd\r\nCode: c3 e8 17 32 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48\r\nRSP: 002b:00007fbf98d0cbf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001\r\nRAX: ffffffffffffffda RBX: 00007fbf9a0d9f80 RCX: 00007fbf99f9d6fd\r\nRDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003\r\nRBP: 00007fbf9a00ab55 R08: 0000000000000000 R09: 0000000000000000\r\nR10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000\r\nR13: 00007ffd4967749f R14: 00007ffd49677640 R15: 00007fbf98d0cd80\r\nAllocated by task 3706:\r\n kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38\r\n kasan_set_track mm/kasan/common.c:46 [inline]\r\n set_alloc_info mm/kasan/common.c:434 [inline]\r\n ____kasan_kmalloc mm/kasan/common.c:513 [inline]\r\n __kasan_kmalloc+0x7c/0x90 mm/kasan/common.c:522\r\n kmalloc include/linux/slab.h:591 [inline]\r\n proc_test_write+0x3a/0x70 drivers/char/test.c:44\r\n pde_write fs/proc/inode.c:335 [inline]\r\n proc_reg_write+0x1df/0x260 fs/proc/inode.c:347\r\n vfs_write fs/read_write.c:603 [inline]\r\n vfs_write+0x199/0x720 fs/read_write.c:585\r\n ksys_write+0x100/0x210 fs/read_write.c:658\r\n do_syscall_x64 arch/x86/entry/common.c:50 [inline]\r\n do_syscall_64+0x3b/0x90 arch/x86/entry/common.c:80\r\n entry_SYSCALL_64_after_hwframe+0x44/0xae\r\nThe buggy address belongs to the object at ffff888004177c00\r\nThe buggy address is located 0 bytes inside of\r\nThe buggy address belongs to the page:\r\npage:00000000d219ec65 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4174\r\nhead:00000000d219ec65 order:2 compound_mapcount:0 compound_pincount:0\r\nflags: 0x100000000010200(slab|head|node=0|zone=1)\r\nraw: 0100000000010200 0000000000000000 0000000100000001 ffff888001041c80\r\nraw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000\r\npage dumped because: kasan: bad access detected\r\nMemory state around the buggy address:\r\n ffff888004177d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00\r\n ffff888004177d80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00\r\n>ffff888004177e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc\r\n                   ^\r\n ffff888004177e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc\r\n ffff888004177f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc', 'kernel', '2023-05-22 08:33:53', 10);
INSERT INTO `classifybug` VALUES (25, 'PROC_DEV:into open!\r\nBUG: KASAN: slab-out-of-bounds in instrument_copy_from_user include/linux/instrumented.h:135 [inline]\r\nBUG: KASAN: slab-out-of-bounds in _copy_from_user+0x41/0xa0 lib/usercopy.c:15\r\nWrite of size 4096 at addr ffff888004177c00 by task syz-executor/3706\r\nPROC_DEV:into open!\r\nCPU: 0 PID: 3706 Comm: syz-executor Not tainted 5.14.0 #2\r\nHardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014\r\nCall Trace:\r\n __dump_stack lib/dump_stack.c:88 [inline]\r\n dump_stack_lvl+0x4d/0x66 lib/dump_stack.c:105\r\n print_address_description.constprop.0+0x21/0x140 mm/kasan/report.c:233\r\n __kasan_report mm/kasan/report.c:419 [inline]\r\n kasan_report.cold+0x7f/0x11b mm/kasan/report.c:436\r\n check_region_inline mm/kasan/generic.c:183 [inline]\r\n kasan_check_range+0x17c/0x1e0 mm/kasan/generic.c:189\r\n instrument_copy_from_user include/linux/instrumented.h:135 [inline]\r\n _copy_from_user+0x41/0xa0 lib/usercopy.c:15\r\n copy_from_user include/linux/uaccess.h:192 [inline]\r\n proc_test_write+0x4a/0x70 drivers/char/test.c:46\r\n pde_write fs/proc/inode.c:335 [inline]\r\n proc_reg_write+0x1df/0x260 fs/proc/inode.c:347\r\n vfs_write fs/read_write.c:603 [inline]\r\n vfs_write+0x199/0x720 fs/read_write.c:585\r\n ksys_write+0x100/0x210 fs/read_write.c:658\r\n do_syscall_x64 arch/x86/entry/common.c:50 [inline]\r\n do_syscall_64+0x3b/0x90 arch/x86/entry/common.c:80\r\n entry_SYSCALL_64_after_hwframe+0x44/0xae\r\nRIP: 0033:0x7fbf99f9d6fd\r\nCode: c3 e8 17 32 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48\r\nRSP: 002b:00007fbf98d0cbf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001\r\nRAX: ffffffffffffffda RBX: 00007fbf9a0d9f80 RCX: 00007fbf99f9d6fd\r\nRDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003\r\nRBP: 00007fbf9a00ab55 R08: 0000000000000000 R09: 0000000000000000\r\nR10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000\r\nR13: 00007ffd4967749f R14: 00007ffd49677640 R15: 00007fbf98d0cd80\r\nAllocated by task 3706:\r\n kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38\r\n kasan_set_track mm/kasan/common.c:46 [inline]\r\n set_alloc_info mm/kasan/common.c:434 [inline]\r\n ____kasan_kmalloc mm/kasan/common.c:513 [inline]\r\n __kasan_kmalloc+0x7c/0x90 mm/kasan/common.c:522\r\n kmalloc include/linux/slab.h:591 [inline]\r\n proc_test_write+0x3a/0x70 drivers/char/test.c:44\r\n pde_write fs/proc/inode.c:335 [inline]\r\n proc_reg_write+0x1df/0x260 fs/proc/inode.c:347\r\n vfs_write fs/read_write.c:603 [inline]\r\n vfs_write+0x199/0x720 fs/read_write.c:585\r\n ksys_write+0x100/0x210 fs/read_write.c:658\r\n do_syscall_x64 arch/x86/entry/common.c:50 [inline]\r\n do_syscall_64+0x3b/0x90 arch/x86/entry/common.c:80\r\n entry_SYSCALL_64_after_hwframe+0x44/0xae\r\nThe buggy address belongs to the object at ffff888004177c00\r\nThe buggy address is located 0 bytes inside of\r\nThe buggy address belongs to the page:\r\npage:00000000d219ec65 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4174\r\nhead:00000000d219ec65 order:2 compound_mapcount:0 compound_pincount:0\r\nflags: 0x100000000010200(slab|head|node=0|zone=1)\r\nraw: 0100000000010200 0000000000000000 0000000100000001 ffff888001041c80\r\nraw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000\r\npage dumped because: kasan: bad access detected\r\nMemory state around the buggy address:\r\n ffff888004177d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00\r\n ffff888004177d80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00\r\n>ffff888004177e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc\r\n                   ^\r\n ffff888004177e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc\r\n ffff888004177f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc', 'kernel ', '2023-11-02 05:49:02', 8);

-- ----------------------------
-- Table structure for disres
-- ----------------------------
DROP TABLE IF EXISTS `disres`;
CREATE TABLE `disres`  (
  `dis_id` int NOT NULL AUTO_INCREMENT,
  `dis_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  `distill` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dis_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disres
-- ----------------------------
INSERT INTO `disres` VALUES (5, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-03 02:55:55\n种子总数: 43438\r\n提取的进程总数: 441\r\n有效种子总数: 在 439 strong-distilled programs 程序中，从 43438 个系统调用提取出 635 个系统调用\r\n反序列化程序 => deserialized/\n\r\n2023/05/03 02:56:07 [31;1m/home/qqstar/goproject/src/github.com/shankarapailoor/moonshine/main.go:260 [35;1mError 1054: Unknown column \'id\' in \'where clause\'\n[0m[33m[2.319ms] [34;1m[rows:0][0m UPDATE disresrec SET deserialized_program = \'deserialized/\' WHERE id = (SELECT id FROM (SELECT id FROM test_time ORDER BY time desc limit 1) as tmp)\n', 11, 'explicit', '2023-05-03 02:56:07', '');
INSERT INTO `disres` VALUES (6, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-03 02:57:38\n种子总数: 43438\r\n提取的进程总数: 441\r\n有效种子总数: 在 439 strong-distilled programs 程序中，从 43438 个系统调用提取出 635 个系统调用\r\n反序列化程序 => deserialized/\n', 11, 'explicit', '2023-05-03 02:57:50', '');
INSERT INTO `disres` VALUES (7, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-03 03:08:10\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的进程总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 11, 'implicit', '2023-05-03 03:08:21', '');
INSERT INTO `disres` VALUES (8, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-03 03:14:04\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的进程总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 11, 'implicit', '2023-05-03 03:14:15', '');
INSERT INTO `disres` VALUES (9, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-04 07:57:07\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 8, 'implicit', '2023-05-04 07:57:22', '5.8日测试');
INSERT INTO `disres` VALUES (11, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-04 08:02:02\n种子总数: 43438\r\n提取的程序总数: 441\r\n有效种子总数: 在 439 strong-distilled programs 程序中，从 43438 个系统调用提取出 635 个系统调用\r\npanic: failed to output file: open ./moonshine/deserialized/distill0: no such file or directory\n\ngoroutine 1 [running]:\ngithub.com/shankarapailoor/moonshine/logging.Failf(...)\n	/home/qqstar/goproject/src/github.com/shankarapailoor/moonshine/logging/logger.go:6\nmain.ParseTraces(0x9c3b15?)\n	/home/qqstar/goproject/src/github.com/shankarapailoor/moonshine/main.go:184 +0x8a5\nmain.main()\n	/home/qqstar/goproject/src/github.com/shankarapailoor/moonshine/main.go:73 +0x9f\n', 8, 'explicit', '2023-05-04 08:02:14', '反序列化文件位置错误');
INSERT INTO `disres` VALUES (12, './moonshine/getting-started/sampletraces/\n文件总数: 346\r\ntime= 2023-05-04 08:03:05\n种子总数: 43438\r\n提取的程序总数: 441\r\n有效种子总数: 在 439 strong-distilled programs 程序中，从 43438 个系统调用提取出 635 个系统调用\r\n反序列化程序 => deserialized/\n', 8, 'explicit', '2023-05-04 08:03:17', '5.4日更改');
INSERT INTO `disres` VALUES (15, '文件总数: 346\r\ntime= 2023-05-04 08:15:01\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 9, 'implicit', '2023-05-04 08:15:13', '');
INSERT INTO `disres` VALUES (16, '文件总数: 346\r\ntime= 2023-05-04 08:24:07\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 9, 'implicit', '2023-05-04 08:24:21', '');
INSERT INTO `disres` VALUES (17, '文件总数: 346\r\ntime= 2023-05-04 08:30:58\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 10, 'implicit', '2023-05-04 08:31:09', '前端结果显示不全');
INSERT INTO `disres` VALUES (18, '文件总数: 346\r\ntime= 2023-05-04 08:36:59\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 08:37:11', '前端取map内容出错');
INSERT INTO `disres` VALUES (19, '文件总数: 346\r\ntime= 2023-05-04 08:38:59\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 08:39:10', '');
INSERT INTO `disres` VALUES (20, '文件总数: 346\r\ntime= 2023-05-04 09:30:06\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:30:17', '');
INSERT INTO `disres` VALUES (21, '文件总数: 346\r\ntime= 2023-05-04 09:33:04\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:33:16', '');
INSERT INTO `disres` VALUES (22, '文件总数: 346\r\ntime= 2023-05-04 09:50:03\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:50:14', '');
INSERT INTO `disres` VALUES (23, '文件总数: 346\r\ntime= 2023-05-04 09:51:52\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:52:03', '');
INSERT INTO `disres` VALUES (24, '文件总数: 346\r\ntime= 2023-05-04 09:52:54\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:53:06', '');
INSERT INTO `disres` VALUES (25, '文件总数: 346\r\ntime= 2023-05-04 09:54:11\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:54:22', 'echarts配置错误');
INSERT INTO `disres` VALUES (26, '文件总数: 346\r\ntime= 2023-05-04 09:56:40\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 09:56:51', '');
INSERT INTO `disres` VALUES (27, '文件总数: 346\r\ntime= 2023-05-04 10:00:08\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:00:19', '');
INSERT INTO `disres` VALUES (28, '文件总数: 346\r\ntime= 2023-05-04 10:03:16\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:03:27', '');
INSERT INTO `disres` VALUES (29, '文件总数: 346\r\ntime= 2023-05-04 10:05:11\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:05:22', '');
INSERT INTO `disres` VALUES (30, '文件总数: 346\r\ntime= 2023-05-04 10:14:31\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:14:43', '');
INSERT INTO `disres` VALUES (31, '文件总数: 346\r\ntime= 2023-05-04 10:17:54\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:18:05', '');
INSERT INTO `disres` VALUES (32, '文件总数: 346\r\ntime= 2023-05-04 10:19:56\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:20:08', '');
INSERT INTO `disres` VALUES (33, '文件总数: 346\r\ntime= 2023-05-04 10:21:20\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:21:32', '');
INSERT INTO `disres` VALUES (34, '文件总数: 346\r\ntime= 2023-05-04 10:22:04\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-04 10:22:16', '');
INSERT INTO `disres` VALUES (35, '文件总数: 346\r\ntime= 2023-05-06 23:09:46\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 12, 'implicit', '2023-05-06 23:10:04', '');
INSERT INTO `disres` VALUES (36, '文件总数: 346\r\ntime= 2023-05-21 00:37:07\n种子总数: 43438\r\n提取的程序总数: 441\r\n有效种子总数: 在 439 strong-distilled programs 程序中，从 43438 个系统调用提取出 635 个系统调用\r\n反序列化程序 => deserialized/\n', 10, 'explicit', '2023-05-21 00:37:26', '');
INSERT INTO `disres` VALUES (37, '文件总数: 346\r\ntime= 2023-05-21 01:58:20\n种子总数: 43438\r\n使用 43438 个系统调用并且通过覆盖率来执行隐式提取\r\n提取的程序总数: 383\r\n平均进程长度: 11\r\n有效系统调用总数: 从 43438 个系统调用提取出 635 个系统调用，在 381 个隐式提炼的程序中，包含 3885 个系统调用\r\n反序列化程序 => deserialized/\n', 10, 'implicit', '2023-05-21 01:58:37', '666');

-- ----------------------------
-- Table structure for disresrec
-- ----------------------------
DROP TABLE IF EXISTS `disresrec`;
CREATE TABLE `disresrec`  (
  `dis_id` int NOT NULL AUTO_INCREMENT,
  `file_total` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seeds_total` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pro_total` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `distiiled_program` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `valid_calls` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deserialized_program` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avg_pro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dis_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of disresrec
-- ----------------------------
INSERT INTO `disresrec` VALUES (5, '346', '43438', '441', '439', '635', '', '2023-05-03 02:55:55', NULL);
INSERT INTO `disresrec` VALUES (6, '346', '43438', '441', '439', '635', 'deserialized/', '2023-05-03 02:57:38', NULL);
INSERT INTO `disresrec` VALUES (7, '346', '43438', '', '381', '635', 'deserialized/', '2023-05-03 03:08:10', '11');
INSERT INTO `disresrec` VALUES (8, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-03 03:14:04', '11');
INSERT INTO `disresrec` VALUES (9, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 07:57:07', '11');
INSERT INTO `disresrec` VALUES (11, '346', '43438', '441', '439', '635', '', '2023-05-04 08:02:02', '');
INSERT INTO `disresrec` VALUES (12, '346', '43438', '441', '439', '635', 'deserialized/', '2023-05-04 08:03:05', '');
INSERT INTO `disresrec` VALUES (15, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 08:15:01', '11');
INSERT INTO `disresrec` VALUES (16, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 08:24:07', '11');
INSERT INTO `disresrec` VALUES (17, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 08:30:58', '11');
INSERT INTO `disresrec` VALUES (18, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 08:36:59', '11');
INSERT INTO `disresrec` VALUES (19, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 08:38:59', '11');
INSERT INTO `disresrec` VALUES (20, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:30:06', '11');
INSERT INTO `disresrec` VALUES (21, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:33:04', '11');
INSERT INTO `disresrec` VALUES (22, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:50:03', '11');
INSERT INTO `disresrec` VALUES (23, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:51:52', '11');
INSERT INTO `disresrec` VALUES (24, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:52:54', '11');
INSERT INTO `disresrec` VALUES (25, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:54:11', '11');
INSERT INTO `disresrec` VALUES (26, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 09:56:40', '11');
INSERT INTO `disresrec` VALUES (27, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:00:08', '11');
INSERT INTO `disresrec` VALUES (28, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:03:16', '11');
INSERT INTO `disresrec` VALUES (29, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:05:11', '11');
INSERT INTO `disresrec` VALUES (30, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:14:31', '11');
INSERT INTO `disresrec` VALUES (31, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:17:54', '11');
INSERT INTO `disresrec` VALUES (32, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:19:56', '11');
INSERT INTO `disresrec` VALUES (33, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:21:20', '11');
INSERT INTO `disresrec` VALUES (34, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-04 10:22:04', '11');
INSERT INTO `disresrec` VALUES (35, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-06 23:09:46', '11');
INSERT INTO `disresrec` VALUES (36, '346', '43438', '441', '439', '635', 'deserialized/', '2023-05-21 00:37:07', '');
INSERT INTO `disresrec` VALUES (37, '346', '43438', '383', '381', '635', 'deserialized/', '2023-05-21 01:58:20', '11');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `files_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seeds_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pro_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `distilled_pro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `valid_calls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deser_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avg_pro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `distill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES (1, '346', '43438', '383', '381', '635', './moonshine/getting-started/samples/', './moonshine/deserialized', '11', 'implicit');
INSERT INTO `result` VALUES (2, '346', '43438', '441', '439', '635', 'started/samples/', './moonshine/deserialized', NULL, 'explicit');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`  (
  `session_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`session_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('2fd81487-7039-4a46-5f5e-f9dd450d21a1', 'lqq', 8);

-- ----------------------------
-- Table structure for test_time
-- ----------------------------
DROP TABLE IF EXISTS `test_time`;
CREATE TABLE `test_time`  (
  `id` int NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_time
-- ----------------------------
INSERT INTO `test_time` VALUES (1, '2006-01-02 15:04:05', '2');
INSERT INTO `test_time` VALUES (2, '2006-01-01 15:04:05', '2');
INSERT INTO `test_time` VALUES (3, '2009-01-02 15:04:05', '333');
INSERT INTO `test_time` VALUES (4, '2001-01-02 16:04:05', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `src` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, 'lqq', '123', '1627556137@qq.com', '/static/img/src/lqq8.jpg');
INSERT INTO `user` VALUES (9, 'admin', '456', 'admin163.qq.com', '/static/img/src/admin9.jpg');
INSERT INTO `user` VALUES (10, 'llqnh', '789', '7ye7eggg@qq.com', '/static/img/src/llqnh10.jpg');
INSERT INTO `user` VALUES (11, 'lisa', '123', '1662fff@qq.com', '/static/img/src/lisa11.jpg');
INSERT INTO `user` VALUES (12, '混水摸鱼', '123', '16666ggt@163.com', '/static/img/src/混水摸鱼12.jpg');

SET FOREIGN_KEY_CHECKS = 1;
