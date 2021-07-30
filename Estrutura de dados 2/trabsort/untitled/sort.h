#ifndef SORT_H
#define SORT_H

class sort
{
private:
    static void Merge(int*V,int PI, int M, int PF);
    static int partition(int*V, int PI, int PF);
    static void Build_MaxHeap(int* A, int N);
    static void MAX_HEAPFY(int* A, int N, int i);
    static void CountingSort(int* A, int N, int k); //estavel
public:
    sort();
    static void SelectionSort(int*V, int N); //depende da implementação
    static void InsertionSort(int* V, int N);
    static void BubbleSort(int* V, int N); //estavel
    static void MergeSort(int*V, int PI, int PF);
    static void QuickSort(int* V, int PI, int PF);
    static void HeapSort(int* V, int N);
};

#endif // SORT_H
