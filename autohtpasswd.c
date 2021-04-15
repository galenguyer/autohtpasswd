#include <stdlib.h>
#include <stdio.h>
#include <strings.h>
#include <shadow.h>
#include <unistd.h>

int main() {
    if (getuid() != 0) {
        puts("Must be run as root.");
        exit(1);
    }
    setspent();
    struct spwd* curr = getspent();
    while (curr != NULL) {
        printf("%s\n", curr->sp_namp);
        curr = getspent();
    }
}