resource db {
    on MianBo-DB01 {
	device /dev/drbd0;
	disk /dev/vg-mb/lv-mb-db;
	address 172.16.200.232:7789;
	meta-disk	internal;
    }
    on MianBo-DB02 {
	device /dev/drbd0;
	disk /dev/vg-mb/lv-mb-db;
	address 172.16.200.128:7789;
	meta-disk	internal;
	}
}
