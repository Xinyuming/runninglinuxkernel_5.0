#include <stdio.h>
#include <fcntl.h>
#include <time.h>
#include <unistd.h>
int main(void)
{
	int fd = 0;
	fd = open("a.txt",O_RDONLY);
	printf("fd is %d\n",fd);
	while(1)
	{
		sleep(1);
		printf("fd is %d\n",fd);
	}

	return 0;
}
