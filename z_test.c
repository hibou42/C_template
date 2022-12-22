# include "./libft/libft.h"
# include <fcntl.h>

int main (void)
{
	int	fd;
	int	i = 0;

	printf("GNL tester\n");
	fd = open("./ascii_art/hibou_txt", O_RDONLY);
	while (i < 8)
	{
		char	*str = get_next_line(fd);
		printf("%s", str);
		i++;
	}

	printf("\nft_printf tester\n\n");
	ft_printf("Coucou hibou \nThe GNL tester printf a total of %d lines\n", i);
		
	return (0);
}
