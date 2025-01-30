#include <iostream>
#include <chrono>
using namespace std;

static int array1[1000] = {0};
static int array2[2000] = {0};
static int array3[3000] = {0};
static int array4[4000] = {0};
static int array5[5000] = {0};
static int array6[6000] = {0};
static int array7[7000] = {0};
static int array8[8000] = {0};
static int array9[9000] = {0};
static int array10[10000] = {0};

// Swap function to swap elements at indices k and k+1 in the array
void swap(int v[], int k) {
	int temp = v[k];
    	v[k] = v[k + 1];
    	v[k + 1] = temp;
}

// Sort function to sort the array using the given logic
void sort(int v[], int n) {
    	for (int i = 0; i < n; i++) {
        	for (int j = i - 1; j >= 0 && v[j] > v[j + 1]; j--) {
            	swap(v, j);
        	}
    	}
}

int main()
{
	for (int i = 1000; i > 0; i--) {
		array1[i] = i;
	}

        auto start1 = chrono::high_resolution_clock::now();

        sort(array1, 1000);

        auto end1 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration1 = end1 - start1;

        cout << "Elapsed Time (1000 elements): " << duration1.count() << " ms" << endl;

        for (int i = 2000; i > 0; i--) {
                array2[i] = i;
        }

        auto start2 = chrono::high_resolution_clock::now();

        sort(array2, 2000);

        auto end2 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration2 = end2 - start2;

        cout << "Elapsed Time (2000 elements): " << duration2.count() << " ms" << endl;

	for (int i = 3000; i > 0; i--) {
                array3[i] = i;
        }

        auto start3 = chrono::high_resolution_clock::now();

        sort(array3, 3000);

        auto end3 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration3 = end3 - start3;

        cout << "Elapsed Time (3000 elements): " << duration3.count() << " ms" << endl;

	for (int i = 4000; i > 0; i--) {
                array4[i] = i;
        }

        auto start4 = chrono::high_resolution_clock::now();

        sort(array4, 4000);

        auto end4 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration4 = end4 - start4;

        cout << "Elapsed Time (4000 elements): " << duration4.count() << " ms" << endl;

	for (int i = 5000; i > 0; i--) {
                array5[i] = i;
        }

        auto start5 = chrono::high_resolution_clock::now();

        sort(array5, 5000);

        auto end5 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration5 = end5 - start5;

        cout << "Elapsed Time (5000 elements): " << duration5.count() << " ms" << endl;

	for (int i = 6000; i > 0; i--) {
                array6[i] = i;
        }

        auto start6 = chrono::high_resolution_clock::now();

        sort(array6, 6000);

        auto end6 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration6 = end6 - start6;

        cout << "Elapsed Time (6000 elements): " << duration6.count() << " ms" << endl;

	for (int i = 7000; i > 0; i--) {
                array7[i] = i;
        }

        auto start7 = chrono::high_resolution_clock::now();

        sort(array7, 7000);

        auto end7 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration7 = end7 - start7;

        cout << "Elapsed Time (7000 elements): " << duration7.count() << " ms" << endl;

	for (int i = 8000; i > 0; i--) {
                array8[i] = i;
        }

        auto start8 = chrono::high_resolution_clock::now();

        sort(array8, 8000);

        auto end8 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration8 = end8 - start8;

        cout << "Elapsed Time (8000 elements): " << duration8.count() << " ms" << endl;

	for (int i = 9000; i > 0; i--) {
                array9[i] = i;
        }

        auto start9 = chrono::high_resolution_clock::now();

        sort(array9, 9000);

        auto end9 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration9 = end9 - start9;

        cout << "Elapsed Time (9000 elements): " << duration9.count() << " ms" << endl;

	for (int i = 10000; i > 0; i--) {
                array10[i] = i;
        }

        auto start10 = chrono::high_resolution_clock::now();

        sort(array10, 10000);

        auto end10 = chrono::high_resolution_clock::now();
        chrono::duration<double, milli> duration10 = end10 - start10;

        cout << "Elapsed Time (10000 elements): " << duration10.count() << " ms" << endl;
}

