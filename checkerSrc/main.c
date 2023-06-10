

#include "../rush00.h"



int validateInput(char *input) 
{
    int count = 0;
    while (input[count] != '\0') {
        if (input[count] < '0' || input[count] > '9') {
            return -1;
        }
        count++;
    }
    return 0;
}

int main(int argc, char **argv)
{
	t_ro	*options;
	
	if (argc != 4)
		return (0);
	if (validateInput(argv[1]) == -1 || validateInput(argv[2]) == -1)
        return 0;
	options = (t_ro*)malloc(sizeof(t_ro));
	rush(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), options);
	free(options);
	return (0);
}