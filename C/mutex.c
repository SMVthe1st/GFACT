//wut am I doing

#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

pthread_t threadId[100];
pthread_mutex_t lock;
int counter = 0;

void *message (void *arg) {
    pthread_mutex_lock(&lock);
    printf("Thread %d\n", ++counter);
    pthread_mutex_unlock(&lock);    
    sleep(1);
    return NULL;
}

int main () {
    pthread_mutex_init(&lock, NULL);
    for (int id = 1; id <= 50; id++) {
      pthread_create(&(threadId[id]), NULL, message, NULL);
    }
    for (int id = 0; id < 5; id++) {
        pthread_join(threadId[id], NULL);
    }
    pthread_mutex_destroy(&lock);

    return 0;
}
