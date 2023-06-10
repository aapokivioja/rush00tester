

#include "../rush00.h"





int main(int argc, char **argv)
{
	t_ro	*options;

	options = (t_ro*)malloc(sizeof(t_ro));
	rush(atoi(argv[1]), atoi(argv[2]), 2, options);
	free(options);
	return (0);
}