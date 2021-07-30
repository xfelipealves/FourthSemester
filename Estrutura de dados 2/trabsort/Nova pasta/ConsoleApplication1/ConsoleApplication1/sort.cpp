#include "sort.h"

sort::sort()
{

}

void sort::SelectionSort(int* V, int N)
{
    for (int i = 0; i < N - 1; i++) //O(n)
    {
        int menor, j;
        for (menor = i, j = menor + 1; j < N; j++) //O(n+(n-1)+(n-2)+...+2)
        {
            if (V[j] < V[menor]) menor = j; //O((n-1)+(n-2)+...+1=n)
        }
        //switch(menor, i);

        int Aux = V[i]; //O(n-1)
        V[i] = V[menor]; //O(n-1)
        V[menor] = Aux; //O(n-1)
    }
    //S= O(n*n)
}

void sort::InsertionSort(int* V, int N)
{
    for (int i = 1; i < N; i++)
    {
        int j, aux;
        for (j = i - 1, aux = V[i]; j >= 0 && aux < V[j]; j--)
        {
            V[j + 1] = V[j];
        }
        V[j + 1] = aux;
    }
}

void sort::BubbleSort(int* V, int N)
{
    bool flag = true;
    for (int i = N - 1; i > 0 && flag; i--)
    {
        flag = false;
        for (int j = 0; j < i; j++)
        {
            if (V[j] > V[j + 1])
            {
                int Aux = V[j];
                V[j] = V[j + 1];
                V[j + 1] = Aux;
                flag = true; //trocou
            }
        }
    }
}

void sort::MergeSort(int* V, int PI, int PF)
{
    if (PI < PF)
    {
        int M = (PI + PF) / 2;
        MergeSort(V, PI, M);
        MergeSort(V, M + 1, PF);
        Merge(V, PI, M, PF);
    }
}

void sort::QuickSort(int* V, int PI, int PF)
{
    if (PI < PF)
    {//tem mais de um elemento para ordenar
        int PV = partition(V, PI, PF);
        QuickSort(V, PI, PV - 1);
        QuickSort(V, PV + 1, PF);
    }
}

void sort::HeapSort(int* V, int N)
{
    Build_MaxHeap(V, N);   //O(N/2lgN)
    int aux;
    for (int i = N; i > 1; i--) //Θ(N)
    {
        aux = V[1];           //O(N)
        V[1] = V[i];
        V[i] = aux;
        MAX_HEAPFY(V, i - 1, 1);    //O(N lgN/i)
    }
}

int sort::partition(int* V, int PI, int PF)
{
    int pivot = V[PI];
    int esq, dir;
    for (esq = PI, dir = PF + 1; esq < dir;)
    {
        do esq++; while (esq <= PF && V[esq] < pivot);
        do dir--; while (V[dir] > pivot);
        if (esq < dir)//ainda não é o final
        {
            int aux = V[esq];
            V[esq] = V[dir];
            V[dir] = aux;
        }
    }
    int aux = V[PI];
    V[PI] = V[dir];
    V[dir] = aux;
    return dir;
}

void sort::Build_MaxHeap(int* A, int N)
{
    for (int i = N / 2; i >= 1; i--)
    {
        MAX_HEAPFY(A, N, i);
    }
}

void sort::MAX_HEAPFY(int* A, int N, int i)
{
    int l = 2 * i;
    int r = 2 * i + 1;
    int maior = i;
    if (l <= N && A[l] > A[maior])
    {
        maior = l;
    }
    if (r <= N && A[r] > A[maior])
    {
        maior = r;
    }
    if (maior != i)
    {
        int aux = A[maior];
        A[maior] = A[i];
        A[i] = aux;
        MAX_HEAPFY(A, N, maior);
    }

}

void sort::CountingSort(int* A, int N, int k)   //O(n)
{
    int* vet=new int[k + 1];
    for (int i = 0; i <= k; i++)  //O(k)
    {
        vet[i] = 0;
    }
    for (int i = 0; i < N; i++)    //O(n)
    {
        vet[A[i]]++;        //O(n)
    }
    for (int i = 1; i <= k; i++)   //O(k)
    {
        vet[i] += vet[i - 1];   //O(k)
        /* acumula a quantdade de elementos alocados nas posições
         * anteriores + a a da posição atual */
    }
    int* aux=new int[N];
    for (int i = N - 1; i >= 0; i--) //O(n)
    {
        aux[vet[A[i]]] = A[i];//O(n)
        vet[A[i]]--;        //O(n)
    }
    for (int i = 1; i <= N; i++)   //O(n)
    {
        A[i - 1] = aux[i];      //O(n)
    }
}

void sort::Merge(int* V, int PI, int M, int PF)
{
    int n = PF - PI + 1;
    int* aux = new int[n];
    int i, j, k;
    for (i = PI, j = M + 1, k = 0; i <= M && j <= PF; k++)
    {
        if (V[i] < V[j])
        {
            aux[k] = V[i];
            i++;
        }
        else
        {
            aux[k] = V[j];
            j++;
        }
    }
    for (; i <= M; i++, k++)
    {
        aux[k] = V[i];
    }
    for (; j <= PF; j++, k++)
    {
        aux[k] = V[j];
    }
    for (i = 0; i < n; i++, PI++)
    {
        V[PI] = aux[i];
    }
}