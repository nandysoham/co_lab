/*
whether machine is a bigendian or little endian -->

whether the last byte of the multi byte datatype is stored first or last
last byte stored first --> little endian
last byte store last --> big endian


so int--> multi-byte datatype
char -->  single byte dtype


so if we point a character pointer to int value and then derefernce it ->
it will have only 1 bit

if the bit is set --> this means the last bit is in the front --> little endian
else it is not ---> big endian

*/

#include <bits/stdc++.h>
using namespace std;

#define all(x) x.begin(),x.end()
typedef long long int ll;

const int mod = 1e9 +7;
const int N = 1e5 + 6; 


int32_t main(int argc, char* argv[]){
    int i =1;
    char* ptr = (char*) &i;
    if(*ptr) cout<<"Little endian";
    else cout<<"Big endian";
}