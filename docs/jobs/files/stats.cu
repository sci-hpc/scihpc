#include <stdio.h>
#include <cuda_runtime.h>

void printDeviceInfo(cudaDeviceProp prop) {

   printf("Name                         - %s\n",  prop.name);
   printf("Total global memory          - %lu MB \n", prop.totalGlobalMem/(1024*1024));
   printf("Total constant memory        - %lu KB \n", prop.totalConstMem/1024);

   printf("Shared memory per block      - %lu KB \n", prop.sharedMemPerBlock/1024);
   printf("Total registers per block    - %d\n", prop.regsPerBlock);
   printf("Maximum threads per block    - %d\n", prop.maxThreadsPerBlock);

   printf("Clock rate                   - %d\n",  prop.clockRate);
   printf("Number of multi-processors   - %d\n",  prop.multiProcessorCount);

  }

int main( ) {

    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    printf("Available CUDA devices - %d\n", deviceCount);
    for (int i=0;i<deviceCount;i++){

        // Device informatioon
        printf("\nCUDA Device #%d\n", i);
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);
        printDeviceInfo(prop);

    }
}