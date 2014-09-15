#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>

#define ECHO_PORT 10001
#define RCVBUFSIZE 1024

int main(int argc, char *argv[])
{
    int client_sock;
    struct sockaddr_in server_addr;
    char echo_string[] = "hello, world.";
    int echo_string_len = strlen(echo_string);
    int recv_size;
    char echo_buffer[RCVBUFSIZE];

    client_sock = socket(PF_INET, SOCK_STREAM, 0);
    if (client_sock < 0)
    {
        printf("socket error.\n");
        return -1;
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    server_addr.sin_port = htons(ECHO_PORT);
    if (connect(client_sock, (struct sockaddr*)&server_addr, 
                sizeof(server_addr)) < 0)
    {
        printf("conect error.\n");
        return -1;
    }

    if (send(client_sock, echo_string, echo_string_len, 0) != echo_string_len)
    {
        printf("send error.\n");
    }

    if ((recv_size = recv(client_sock, echo_buffer, RCVBUFSIZE, 0)) < 0)
    {
        printf("recv error.\n");
        return -1;
    }

    printf("rcv:%s\n", echo_buffer);
    close(client_sock);

}
