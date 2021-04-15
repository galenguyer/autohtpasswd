#include <stdlib.h>
#include <stdio.h>
#include <string.h>
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
        if (strcmp(curr->sp_pwdp, "!*") != 0) {
            printf("%s - %s\n", curr->sp_namp, curr->sp_pwdp);
        }
        curr = getspent();
    }
}