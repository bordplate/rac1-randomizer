#define items_map ((char*)0xB00050)

bool _start(unsigned int item_id) {
	return items_map[item_id] != 0;
}