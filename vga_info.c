#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    FILE *fp;
    char buffer[1024];
    char *model_start;

    fp = popen("nvidia-smi --query-gpu=name --format=csv,noheader", "r");
    if (fp == NULL) {
        fprintf(stderr, "Failed to run nvidia-smi command\n");
        return 1;
    }

    if (fgets(buffer, sizeof(buffer), fp) != NULL) {
        // Remove trailing newline character if present
        buffer[strcspn(buffer, "\n")] = 0;
        printf("NVIDIA GPU Model: %s\n", buffer);
    } else {
        fprintf(stderr, "Failed to read output from nvidia-smi\n");
    }

    pclose(fp);
    return 0;
}
