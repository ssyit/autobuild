#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件
# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好


# 后台IP设置
export Ipv4_ipaddr="192.168.2.2"            # 修改openwrt后台地址(填0为关闭)
export Netmask_netm="255.255.255.0"         # IPv4 子网掩码（默认：255.255.255.0）(填0为不作修改)
export Op_name="OpenWrt-123"                # 修改主机名称为OpenWrt-123(填0为不作修改)

# 默认主题设置
export Mandatory_theme="argon"              # 将bootstrap替换您需要的主题为必选主题(可自行更改您要的,源码要带此主题就行,填写名称也要写对) (填写主题名称,填0为不作修改)
export Default_theme="argon"                # 多主题时,选择某主题为默认第一主题 (填写主题名称,填0为不作修改)

# 旁路由选项
export Gateway_Settings="0"                 # 旁路由设置 IPv4 网关(填入您的网关IP为启用)(填0为不作修改)
export DNS_Settings="0"                     # 旁路由设置 DNS(填入DNS，多个DNS要用空格分开)(填0为不作修改)
export Broadcast_Ipv4="0"                   # 设置 IPv4 广播(填入您的IP为启用)(填0为不作修改)
export Disable_DHCP="0"                     # 旁路由关闭DHCP功能(1为启用命令,填0为不作修改)
export Disable_Bridge="0"                   # 旁路由去掉桥接模式(1为启用命令,填0为不作修改)
export Create_Ipv6_Lan="0"                  # 爱快+OP双系统时,爱快接管IPV6,在OP创建IPV6的lan口接收IPV6信息(1为启用命令,填0为不作修改)

# IPV6、IPV4 选择
export Enable_IPV6_function="0"             # 编译IPV6固件(1为启用命令,填0为不作修改)
export Enable_IPV4_function="0"             # 编译IPV4固件(1为启用命令,填0为不作修改)(如果跟IPV6一起开启的话,优先IPV6功能)

# OpenClash
export OpenClash_branch="master"            # OpenClash代码选择分支（master 或 dev）(填0为不需要此插件)
export OpenClash_Core="1"                   # 编译固件增加OpenClash时,把核心下载好,核心为3MB左右大小(1为启用命令,填0为不需要核心)

# 个性签名,默认增加年月日[$(TZ=UTC-8 date "+%Y.%m.%d")]
export Customized_Information="$(TZ=UTC-8 date "+%Y.%m.%d")"  # 个性签名,你想写啥就写啥，(填0为不作修改)

# 更换固件内核
export Replace_Kernel="0"                    # 更换内核版本,在对应源码的[target/linux/架构]查看patches-x.x,看看x.x有啥就有啥内核了(填入内核版本号,填0为不作修改)

# 设置免密码登录(个别源码本身就没密码的)
export Password_free_login="1"               # 设置首次登录后台密码为空（进入openwrt后自行修改密码）(1为启用命令,填0为不作修改)

# 增加AdGuardHome插件时把核心一起下载好
export AdGuardHome_Core="0"                  # 编译固件增加AdGuardHome时,把核心下载好,需要注意的是一个核心20多MB的,小闪存机子搞不来(1为启用命令,填0为不需要核心)

# 其他
export Ttyd_account_free_login="0"           # 设置ttyd免密登录(1为启用命令,填0为不作修改)
export Delete_unnecessary_items="1"          # 个别机型内一堆其他机型固件,删除其他机型的,只保留当前主机型固件(1为启用命令,填0为不作修改)
export Disable_53_redirection="1"            # 删除DNS强制重定向53端口防火墙规则(个别源码本身不带此功能)(1为启用命令,填0为不作修改)
export Cancel_running="1"                    # 取消路由器每天跑分任务(个别源码本身不带此功能)(1为启用命令,填0为不作修改)


# 设置打包固件的机型和内核组合（可用内核是时时变化的,过老的内核就删除的，所以要选择什么内核请看说明）
# 内核，机型，固件rootfs大小填入示例
# export amlogic_model="此内填入可用芯片，或多芯片组合"
# export amlogic_kernel="此内填入内核，或者多内核组合"
# export auto_kernel="true" 是否自动检测最新内核来打包（true为是，false为不是，如果不是的话，要填写当前有的准确内核版本）
# 自动检测最新内核,比如您写的是 5.15.25 当前最高版本为 5.15.78 的话就自动打包5.15.78的,不自动检测的话,就打包 5.15.25
# export rootfs_size="填入不低于500的数值，数值越大空间越大，一般960够了"
# 可用芯片：a311d, s922x, s905x3, s905x2, s905l3a, s912, s905d, s905x, s905w, s905
# 对应支持什么机型，请看说明
# 可选内核 （5.4.xx） （5.10.xx） （5.15.xx） （6.0.xx）

export amlogic_model="s905d_s905x_s912"
export amlogic_kernel="5.10.01_5.15.01"
export auto_kernel="true"
export rootfs_size="960"



# 修改插件名字
sed -i 's/"aMule设置"/"电驴下载"/g' `egrep "aMule设置" -rl ./`
sed -i 's/"网络存储"/"NAS"/g' `egrep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `egrep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `egrep "实时流量监测" -rl ./`
sed -i 's/"KMS 服务器"/"KMS激活"/g' `egrep "KMS 服务器" -rl ./`
sed -i 's/"TTYD 终端"/"命令窗"/g' `egrep "TTYD 终端" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `egrep "USB 打印服务器" -rl ./`
sed -i 's/"Web 管理"/"Web管理"/g' `egrep "Web 管理" -rl ./`
sed -i 's/"管理权"/"改密码"/g' `egrep "管理权" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `egrep "带宽监控" -rl ./`


# 整理固件包时候,删除您不想要的固件或者文件,让它不需要上传到Actions空间
cat >"$CLEAR_PATH" <<-EOF
packages
config.buildinfo
feeds.buildinfo
sha256sums
version.buildinfo
openwrt-armvirt-64-default.manifest
openwrt-armvirt-64-Image
openwrt-armvirt-64-Image-initramfs
EOF
