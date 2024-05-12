#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main () {
    struct sockaddr_in serv;
    serv.sin_family = AF_INET;
    serv.sin_port = htons(1256);
    serv.sin_addr.s_addr = INADDR_ANY;

    int sock = socket(AF_INET, SOCK_STREAM, 0);
    connect(sock, (struct sockaddr *)&serv, sizeof(serv));
    puts("Recieving; type 'exit' to return.");

    while (1) {
        char strData[255];
        memset(strData, '\0', 255);
        recv(sock, strData, sizeof(strData), 0);
        if (strcmp(strData, "exit\n") == 0) {
           puts("Exited.");
           break;
        }
        printf("%s", strData);
    }
    shutdown(sock, SHUT_RD);

    return 0;
}
