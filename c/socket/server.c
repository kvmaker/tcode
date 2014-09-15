#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#define ECHO_PORT 10001
#define RCVBUFSIZE 1024
#define MAXPENDING 5

int main(int argc, char *argv[])
{
    int server_sock;
    struct sockaddr_in server_addr;
    int client_sock;

    server_sock = socket(PF_INET, SOCK_STREAM, 0);
    if (server_sock < 0)
    {
        printf("socket error.\n");
        return -1;
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port = htons(ECHO_PORT);
    if (bind(server_sock, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0)
    {
        printf("bind error.\n");
        return -1;
    }

    if ((client_sock = listen(server_sock, MAXPENDING)) < 0)
    {
        printf("listen error.\n");
        return -1;
    }


    while(1)
    {
        int client_sock;
        struct sockaddr client_addr;
        int client_addr_len;
        int recv_size;
        char echo_buffer[RCVBUFSIZE];

        client_sock = accept(server_sock, &client_addr, &client_addr_len);
        if (client_sock < 0)
        {
            printf("accept error.\n");
            return -1;
        }

        if ((recv_size = recv(client_sock, echo_buffer, RCVBUFSIZE, 0)) < 0)
        {
            printf("recv error.\n");
            return -1;
        }

        while (recv_size > 0)
        {
            printf("rcv:%s\n", echo_buffer);
            if (send(client_sock, echo_buffer, recv_size, 0) != recv_size)
            {
                printf("send error.\n");
                return -1;
            }

            if ((recv_size = recv(client_sock, echo_buffer, RCVBUFSIZE, 0)) < 0)
            {
                printf("recv error.\n");
                return -1;
            }
        }

        close(client_sock);
    }

}
