#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <string.h>
#include <limits.h>
#include <stdio.h>

int int2str(void)
{
    char data[256];
    long int i;

    srandom(time(NULL));
    i = random();
    sprintf(data, "%ld\n", i);

    printf("%s\n", data);

    return 0;
}

int str2int()
{
    char *data = "12345678";
    char *endptr;
    long int val;

    errno = 0;
    val = strtol(data, &endptr, 10);
    if ((errno == ERANGE && (val == LONG_MAX || val == LONG_MIN))
        || (errno != 0 && val == 0)) {
        perror("strtol");
        exit(EXIT_FAILURE);
    }

    if (endptr == data) {
        fprintf(stderr, "No digits were found\n");
        exit(EXIT_FAILURE);
    }

    printf("%ld\n", val);
    return 0;
}

int main()
{
    int2str();
    str2int();

    return 0;
}
