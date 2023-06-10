
#ifndef RUSH00_H
# define RUSH00_H


#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>




typedef struct s_ro
{
	char	left_top;
	char	right_top;
	char	left_down;
	char	right_down;
	char	hor_fil;
	char	ver_fil;
}	t_ro;

void	rush(int x, int y, int whichOne, t_ro *options);

#endif