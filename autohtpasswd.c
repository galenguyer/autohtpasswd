#include <stdlib.h>
#include <stdio.h>
#include <strings.h>
#include <shadow.h>

int main() {
    setspent();
    struct spwd* curr = getspent();
    while (curr != NULL) {
        printf("%s\n", curr->sp_namp);
        curr = getspent();
    }
}