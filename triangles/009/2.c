#include <stdio.h>
#include <stdlib.h>

void sortarray(int *numbers);

int main()
{
    int size;
    scanf("%d", &size);

    int *sums = calloc(size, sizeof(int));

    int numbers[3];
    for (int i=0; i<size; i++) {
        scanf("%d%d%d", &numbers[0], &numbers[1], &numbers[2]);
        sortarray(numbers);
        if (numbers[0] + numbers[1] >= numbers[2]) {
            sums[i] = 1;
        }
        else {
            sums[i] = 0;
        }
    }

    for (int i=0; i<size; i++) {
        printf("%d ", sums[i]);
    }
    printf("\n");

    free(sums);
    return 0;
}

void sortarray(int *numbers)
{
    int t1, t2, largest;
    largest = 0;

    if (numbers[0] > numbers[1] && numbers[0] > numbers[2]) {
        largest = numbers[0];
        t1 = numbers[1];
        t2 = numbers[2];
    }
    else if (numbers[1] > numbers[0] && numbers[1] > numbers[2]) {
        largest = numbers[1];
        t1 = numbers[0];
        t2 = numbers[2];
    }
    else if (numbers[2] > numbers[0] && numbers[2] > numbers[1]) {
        largest = numbers[2];
        t1 = numbers[0];
        t2 = numbers[1];
    }

    numbers[0] = t1;
    numbers[1] = t2;
    numbers[2] = largest;
}
