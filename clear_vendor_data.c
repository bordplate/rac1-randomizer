#define memset ((void (*)(void*, char, int))0x5D0140)
#define moby_data (*((int*)0x0e5a664))

void _start() {
	memset(moby_data, 0, 0x100 * 5);
}