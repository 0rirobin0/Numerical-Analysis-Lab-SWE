// Gaussian Elimination Method for Polynomial Coefficients
// Author: Robin
// Reg ID: 2020831043

#include<bits/stdc++.h>
using namespace std;

// Function to solve a system of linear equations using Gauss Elimination method
vector<double> gaussElimination(vector<vector<double>> systemMatrix, vector<double> constants) {
    int size = systemMatrix.size();
    for (int i = 0; i < size; i++) {
        for (int j = i + 1; j < size; j++) {
            double factor = systemMatrix[j][i] / systemMatrix[i][i];
            for (int k = i; k < size; k++) {
                systemMatrix[j][k] -= factor * systemMatrix[i][k];
            }
            constants[j] -= factor * constants[i];
        }
    }

    // Back-substitution to find coefficients
    vector<double> coefficients(size);
    for (int i = size - 1; i >= 0; i--) {
        coefficients[i] = constants[i];
        for (int j = i + 1; j < size; j++) {
            coefficients[i] -= systemMatrix[i][j] * coefficients[j];
        }
        coefficients[i] /= systemMatrix[i][i];
    }
    return coefficients;
}

// Function to calculate position based on time using the obtained coefficients
double calculatePosition(double time, const vector<double>& coefficients) {
    return coefficients[0] * time * time + coefficients[1] * time + coefficients[2];
}

int main() {
    // System of equations: 25a1 + 5a2 + a3 = 106.8, 64a1 + 8a2 + a3 = 177.2, 144a1 + 12a2 + a3 = 279.2
    vector<vector<double>> systemMatrix = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
    vector<double> constants = {106.8, 177.2, 279.2};

    vector<double> obtainedCoefficients = gaussElimination(systemMatrix, constants); 

    cout << "The unique coefficients are: " << endl;
    cout << "a1 = " << obtainedCoefficients[0] << ", " << "a2 = " << obtainedCoefficients[1] << ", "
         << "a3 = " << obtainedCoefficients[2] << endl;

    // Calculating position at 6th second using the obtained coefficients
    double positionAt6Sec = calculatePosition(6, obtainedCoefficients);

    cout << "The position at t=6 seconds is: " << positionAt6Sec << " units" << endl;

    return 0;
}
