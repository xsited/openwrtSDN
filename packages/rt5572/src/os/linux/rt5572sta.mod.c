#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xa8c16cf3, "module_layout" },
	{ 0x3defeb5e, "register_netdevice" },
	{ 0x9a1dfd65, "strpbrk" },
	{ 0xd2b09ce5, "__kmalloc" },
	{ 0xf9a482f9, "msleep" },
	{ 0x4c4fef19, "kernel_stack" },
	{ 0xd6ee688f, "vmalloc" },
	{ 0x349cba85, "strchr" },
	{ 0x754d539c, "strlen" },
	{ 0xc29bf967, "strspn" },
	{ 0xc5ac94d0, "dev_set_drvdata" },
	{ 0xc8b57c27, "autoremove_wake_function" },
	{ 0xb5dcab5b, "remove_wait_queue" },
	{ 0xc7a4fbed, "rtnl_lock" },
	{ 0x47939e0d, "__tasklet_hi_schedule" },
	{ 0xb10d2a48, "netif_carrier_on" },
	{ 0x1637ff0f, "_raw_spin_lock_bh" },
	{ 0xae68c5b2, "skb_clone" },
	{ 0x4579655a, "dev_get_by_name" },
	{ 0xf22449ae, "down_interruptible" },
	{ 0xbf2ae0f, "netif_carrier_off" },
	{ 0xc1e2a8ff, "usb_kill_urb" },
	{ 0xbeb83495, "filp_close" },
	{ 0xeae3dfd6, "__const_udelay" },
	{ 0xfb0e29f, "init_timer_key" },
	{ 0x85df9b6c, "strsep" },
	{ 0x999e8297, "vfree" },
	{ 0x91715312, "sprintf" },
	{ 0x3bcbbb33, "kthread_create_on_node" },
	{ 0x7d11c268, "jiffies" },
	{ 0xe43f6a80, "skb_trim" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xbe2ed7d2, "__netdev_alloc_skb" },
	{ 0x27f2852, "netif_rx" },
	{ 0xf432dd3d, "__init_waitqueue_head" },
	{ 0x4f8b5ddb, "_copy_to_user" },
	{ 0xffd5a395, "default_wake_function" },
	{ 0x35b6b772, "param_ops_charp" },
	{ 0xd5f2172f, "del_timer_sync" },
	{ 0xfb578fc5, "memset" },
	{ 0x11089ac7, "_ctype" },
	{ 0x8f64aa4, "_raw_spin_unlock_irqrestore" },
	{ 0x571ab46f, "current_task" },
	{ 0xf147ecb1, "down_trylock" },
	{ 0x562b9321, "usb_deregister" },
	{ 0x27e1a049, "printk" },
	{ 0x20c55ae0, "sscanf" },
	{ 0xda2d560c, "kthread_stop" },
	{ 0x449ad0a7, "memcmp" },
	{ 0x6b3c99ec, "free_netdev" },
	{ 0xa1c76e0a, "_cond_resched" },
	{ 0x9166fada, "strncpy" },
	{ 0x3dffe1a5, "register_netdev" },
	{ 0xb4390f9a, "mcount" },
	{ 0x60b71cbb, "wireless_send_event" },
	{ 0xab394b6d, "usb_control_msg" },
	{ 0x16305289, "warn_slowpath_null" },
	{ 0x848dad9c, "skb_push" },
	{ 0x72834cac, "dev_close" },
	{ 0x9545af6d, "tasklet_init" },
	{ 0x8834396c, "mod_timer" },
	{ 0xbe2c0274, "add_timer" },
	{ 0xac28405, "skb_pull" },
	{ 0xbc3d2398, "usb_free_coherent" },
	{ 0x8f96f86d, "dev_kfree_skb_any" },
	{ 0x61651be, "strcat" },
	{ 0x82072614, "tasklet_kill" },
	{ 0xf91e5126, "module_put" },
	{ 0xcbf1ca89, "skb_copy_expand" },
	{ 0x8537b91d, "netif_device_attach" },
	{ 0x29e696a8, "usb_submit_urb" },
	{ 0xeaa9098a, "netif_device_detach" },
	{ 0x550dae9a, "usb_get_dev" },
	{ 0xba63339c, "_raw_spin_unlock_bh" },
	{ 0xf0fdf6cb, "__stack_chk_fail" },
	{ 0x8717c670, "usb_put_dev" },
	{ 0xd62c833f, "schedule_timeout" },
	{ 0x1000e51, "schedule" },
	{ 0xf5373238, "eth_type_trans" },
	{ 0x939708e0, "wake_up_process" },
	{ 0xe048dad7, "pskb_expand_head" },
	{ 0x9327f5ce, "_raw_spin_lock_irqsave" },
	{ 0x5365b016, "unregister_netdevice_queue" },
	{ 0xcf21d241, "__wake_up" },
	{ 0xd2965f6f, "kthread_should_stop" },
	{ 0x5860aad4, "add_wait_queue" },
	{ 0x37a0cba, "kfree" },
	{ 0x69acdf38, "memcpy" },
	{ 0x801678, "flush_scheduled_work" },
	{ 0x5c8b5ce8, "prepare_to_wait" },
	{ 0x71e3cecb, "up" },
	{ 0xdeb87602, "usb_register_driver" },
	{ 0xfa66f77c, "finish_wait" },
	{ 0xf72b1067, "unregister_netdev" },
	{ 0xb742fd7, "simple_strtol" },
	{ 0x28318305, "snprintf" },
	{ 0x2e10cca7, "__netif_schedule" },
	{ 0xb0e602eb, "memmove" },
	{ 0x30d8c27b, "usb_alloc_coherent" },
	{ 0xb9b3502f, "skb_put" },
	{ 0x4f6b400b, "_copy_from_user" },
	{ 0x70c55916, "dev_get_drvdata" },
	{ 0x316eae64, "usb_free_urb" },
	{ 0x6e720ff2, "rtnl_unlock" },
	{ 0x9e7d6bd0, "__udelay" },
	{ 0xfed54737, "try_module_get" },
	{ 0xb93b2d19, "usb_alloc_urb" },
	{ 0xe914e41e, "strcpy" },
	{ 0xfd306865, "filp_open" },
	{ 0x20ac9778, "alloc_etherdev_mqs" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("usb:v148Fp2770d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp2870d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07B8p2870d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07B8p2770d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0039d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p003Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083Ap7512d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0789p0162d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0789p0163d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0789p0164d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v177Fp0302d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0B05p1731d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0B05p1732d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0B05p1742d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0017d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p002Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p002Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p002Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C06d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C28d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2019pED06d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C09d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C11d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C07d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v050Dp8053d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C23d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C27d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07AAp002Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07AAp003Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07AAp003Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1044p800Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v15A9p0006d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApB522d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApA618d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083Ap8522d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083Ap7522d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0CDEp0022d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0586p3416d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0CDEp0025d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9701d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9702d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p200Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C25d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3247d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083Ap6618d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v15C5p0008d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0E66p0001d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0E66p0003d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v129Bp1828d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v157Ep300Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v050Dp805Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v050Dp815Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1482p3C09d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C09d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04E8p2018d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1690p0740d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v5A57p0280d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v5A57p0282d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v7392p7718d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v7392p7717d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1737p0070d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1737p0071d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0411p00E8d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v050Dp815Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v100Dp9031d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p6899d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3070d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3071d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3072d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p3820d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p871Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p822Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p871Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p822Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p003Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0042d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0048d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0047d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p005Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v14B2p3C12d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v18C5p0012d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083Ap7511d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApA701d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApA702d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9703d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9705d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9706d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9707d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9708d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9709d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3273d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3305d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1044p800Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2019pAB25d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2019p5201d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07B8p3070d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07B8p3071d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07B8p3072d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v7392p7711d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v7392p4085d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1A32p0304d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1EDAp2012d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1EDAp2310d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C0Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C16d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07D1p3C17d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1D4Dp000Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1D4Dp000Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1D4Dp0011d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v5A57p5257d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v5A57p0283d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04BBp0945d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04BBp0947d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04BBp0948d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v203Dp1480d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v20B8p8888d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0B05p1784d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v203Dp14A9d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p899Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p3870d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p870Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p6899d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p3822d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p3871d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p871Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p822Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p3821d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DB0p821Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v5A57p0282d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApA703d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3307d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3321d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3329d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07FAp7712d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0789p0166d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0586p341Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0586p341Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0586p343Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1EDAp2012d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1EDAp2210d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2001p3C1Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApB511d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3572d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1740p9801d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0041d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0042d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04BBp0944d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1690p0740d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1690p0744d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v5A57p0284d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v167Bp4001d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1690p0764d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0930p0A07d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1690p0761d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13B1p002Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1737p0079d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0065d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0066d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0068d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3370d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0050d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v083ApB511d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p20DDd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp3573d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v7392p7733d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0846p9012d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0DF6p0067d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1875p7733d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0E66p0021d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2019pED19d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp5370d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp5372d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3365d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v13D3p3329d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2001p3C15d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2001p3C19d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2001p3C1Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2001p3C1Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v043Ep7A12d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v043Ep7A22d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v043Ep7A32d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v043Ep7A42d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04DAp1800d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04DAp1801d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v04DAp23F6d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p2104d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p2180d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p2181d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p2182d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0471p2126d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v057Cp8501d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v148Fp5572d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v043Ep7A32d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v2001p3C1Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v043Ep7A13d*dc*dsc*dp*ic*isc*ip*");

MODULE_INFO(srcversion, "0437D721DA31F3109C8F9D3");
