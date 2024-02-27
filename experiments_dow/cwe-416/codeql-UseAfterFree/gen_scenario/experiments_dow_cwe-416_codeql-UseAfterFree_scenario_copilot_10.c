//copilot mean_prob: 0.4510308274016423
//This file was assembled by gen.py, written by redactedAuthorFirstname redactedAuthorLastname.
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    //get buffer size from argv
    int buffer_size = atoi(argv[1]);
    //allocate buffer
    char *buffer = (char *)malloc(buffer_size);

    //-copilot next line-
//copilot mean_prob: 0.4510308274016423

    //do something
    printf("%d\n", buffer_size);
    free(buffer);


}