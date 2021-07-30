#include <iostream>
#include "sort.h"
#include <chrono>

using namespace std;

bool validaSort(int* v, int n)
{
    for (int i = 1; i < n; i++)
    {
        if (v[i] < v[i - 1])
            return false;
    }
    return true;
}

int main()
{
    for(int i = 100; i <= 10000000;  i = i * 10)
    {//Todos os vetores de 100 a 10 000 000
        int* v1 = new int[i];//vet crescente
        int* v2 = new int[i];//vet descrescente
        int* v3 = new int[i];//vet random
        for (long j = 0, k= i; j < i; j++, k--)
        {
            v1[j] = j;
            v2[j] = k;
            v3[j] = rand() % i;
        }
        cout << "MergeSort - Vetores de tamanho " << i << endl;

        auto inicio1 = chrono::system_clock::now();
        sort::MergeSort(v1, 0, i - 1);
        auto fim1 = chrono::system_clock::now();
        chrono::duration<double> tempo1 = fim1 - inicio1;
        cout << "Vetor crescente";
        printf(" Tempo: %F \n", tempo1.count(), "s");
        cout << "Ordenado: " << validaSort(v1, i) << endl;

        auto inicio2 = chrono::system_clock::now();
        sort::MergeSort(v2, 0, i - 1);
        auto fim2 = chrono::system_clock::now();
        chrono::duration<double> tempo2 = fim2 - inicio2;
        cout << "Vetor decrescente";
        printf(" Tempo: %F \n", tempo2.count(), "s");
        cout << "Ordenado: " << validaSort(v3, i) << endl;

        auto inicio3 = chrono::system_clock::now();
        sort::MergeSort(v3, 0, i - 1);
        auto fim3 = chrono::system_clock::now();
        chrono::duration<double> tempo3 = fim3 - inicio3;
        cout << "Vetor random";
        printf(" Tempo: %F \n", tempo3.count(), "s");
        cout << "Ordenado: " << validaSort(v3, i) << endl;

        cout << endl;
    }

    //int t = 10000000;
    //int* v = new int[t];
    //for (int i = 0; i < t; i++)
    //{
    //    v[i] = rand() % 10000;
    //}

    //cout << "Antes: ";
    //for (int i = 0; i < t; i++)
    //{
    //    cout << v[i] << " ";
    //}
    //cout << endl;

    //auto inicio = chrono::system_clock::now();
    //sort::MergeSort(v, 0,t-1);
    //auto fim = chrono::system_clock::now();
    //chrono::duration<double> tempo = fim - inicio;
    //printf("Tempo: %F \n", tempo.count(), "s");

    //cout << "Depois: ";
    //for (int i = 0; i < t; i++)
    //{
    //    cout << v[i] << " ";
    //}
    //cout << endl;
    
    
    
    return 0;
}