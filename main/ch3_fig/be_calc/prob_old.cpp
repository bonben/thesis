#include <iostream>
#include <cmath>
#include <iomanip>
#include <vector>
#include <algorithm>
double calcDen(std::vector<int> d, std::vector<int> a, double R, double EbN0, int lim){
	//On calcule le denominateur pour la proba. 
	//Il s'agit de la somme des (multiplicité*erfc)
	double result = 0;

	for (int i=0; i<lim; i++){
		//result += (a[i]*std::erfc(std::sqrt(d[i]*R*EbN0)));
		result += (a[i]*std::exp(-d[i]*R*EbN0));
	}
	return result;

}

double calcNom(std::vector<int> d, std::vector<int> a, std::vector<int> w, double R, double EbN0, int nbErr, int lim){
	//On calcule le nominateur pour la proba. 
	//Il s'agit de la somme des (multiplicité*erfc) pour les quelles w/a vaut le nombre d'erreur
	double result = 0.0;

	for (int i=0; i<lim; i++){
		if ((int)std::round((double)w[i]/(double)a[i])==nbErr){
			//result += (a[i]*std::erfc(std::sqrt(d[i]*R*EbN0)));
			result += (a[i]*std::exp(-d[i]*R*EbN0));
			//std::cout << d[i] << std::endl;
		}
	}

	return result;
}


double calcBEFE(std::vector<int> d, std::vector<int> a, std::vector<int> w, double R, double EbN0, int lim){
	// sum(w*erfc)/sum(a*erfc)
	double nom = 0.0, den = 0.0;

	for (int i=0; i<lim; i++){
		den += (a[i]*std::erfc(std::sqrt(d[i]*R*EbN0)));
		nom += (w[i]*std::erfc(std::sqrt(d[i]*R*EbN0)));
	}

	return (nom/den);
}

double calcFER(std::vector<int> d, std::vector<int> a, double R, double EbN0, int lim){
	
	double result = 0.0;
	for (int i=0; i<lim; i++){
		result += 0.5*(a[i]*std::erfc(std::sqrt(d[i]*R*EbN0)));
	}
	return result;
	
}

int main(int argc, char *argv[])
{

	//Spectrum 528 (garello)
//	double K 	= 528.0;
//	std::vector<int> d = {23,24,25,27,28,29,31,32,33,34};
//	std::vector<int> a = { 1, 1, 1, 3, 3, 6, 8, 5,16,12};
//	std::vector<int> w = { 1, 2, 3, 9, 6,16,28,18,54,38};

	//Long Spectrum 528 (garello)
	//double K 	= 528.0;
	//std::vector<int> d = {23,24,25,27,28,29,31,32,33,34,35,36, 37,  38,   39, 40,  41,  42,  43,  44, 45, 46, 47, 48, 49};
	//std::vector<int> a = { 1, 1, 1, 3, 3, 6, 8, 5,16,12,20,24,163,1019, 2015, 87, 255, 564, 614, 983, 1093, 1648, 4068, 2299, 5314};
	//std::vector<int> w = { 1, 2, 3, 9, 6,16,28,18,54,38,80,92,527,6030,17743,408,1493,3182,3188,4506, 6919, 12220, 24504, 15550, 35270};

	//Spectrum 528 (dim, semifull)
//	double K 	= 528.0;
//	std::vector<int> d = { 23, 24, 25,26, 27, 28, 29,30, 31, 32, 33, 34, 35, 36, 37, 38, 39};
//	std::vector<int> a = {  1,  1,  1,  0,  3,  3,  4,  0,  6,  5, 11,  8, 14, 14,100,902,1665};
//	std::vector<int> w = {  1,  2,  3,  0,  9,  6, 12,  0, 20, 18, 39, 28, 58, 56,330,5364,14725};
	//Spectrum 528 (dim, true semifull)
	/*double K 	= 528.0;
    std::vector<int> d = {  23,   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
   	std::vector<int> a = {   1,    1,    1,    0,    3,    3,    5,    0,    6,    4,   10,    9,   14,   14,   96,  762, 1253,   47,  113,  146,  202,  225,  154,   61,  242,   50,   69};
   	std::vector<int> w = {   1,    2,    3,    0,    9,    6,   13,    0,   20,   16,   36,   30,   58,   54,  318, 4522,11023,  222,  703,  800, 1040,  982,  940,  322, 1204,  248,  341};*/



// double K 	= 1784.0;
//    std::vector<int> d = { 34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
//     std::vector<int> a = { 1,    0,    0,    7,    4,    2,    5,    2,    5,    4,    3,    6,    7,    4,  713,    8};
//     std::vector<int> w = { 2,    0,    0,   17,    9,    6,   13,    5,   14,   18,    6,   19,   39,   21, 4248,   39};



	// std::vector<int> d ={23, 24, 25, 27, 28, 29, 31, 32, 33, 34, 35, 36, 37, 38, 39}; 
	// std::vector<int> a ={1, 1, 1, 3, 3, 6, 8, 5, 16, 12, 20, 24, 163, 1019, 163};
 //  	std::vector<int> w ={1, 2, 3, 9, 6, 16, 28, 18, 54, 38, 80, 92, 527, 6030, 527};

	//Spectrum 2048 (garello)
	//double K 	= 2048.0;
	//std::vector<int> d = {27,28,29,30,31,33,34,35,36,37};
	//std::vector<int> a = { 1, 2, 1, 1, 3, 2, 1, 2, 1, 2};
	//std::vector<int> w = { 1, 4, 3, 2, 9, 6, 4, 6, 4, 8};

	//Spectrum 2048 (dim)
	//double K 	= 2048.0;
	//std::vector<int> d = {27,28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
	//std::vector<int> a = { 1, 1,    1,    0,    2,    0,    2,    0,    2,    0,    1,    1,    3,    3,    8,    4,   14,  339,   19,   13,  212,   23,  168};
	//std::vector<int> w = { 1, 2,    3,    0,    6,    0,    6,    0,    6,    0,    3,    4,   11,   14,   24,   18,   66, 1360,  105,   62, 1038,  118, 1104};

//Spectrum 2048 (dim, semi full, map 5.0db) 
//	double K 	= 2048.0;
//	std::vector<int> d = {27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
//	std::vector<int> a = { 1,    2,    1,    1,    3,    0,    2,    1,    2,    1,    1,    2,    6,    5,   19,   15,   28,  466,   40,   54,  498,   77,  561};
//	std::vector<int> w = { 1,    4,    3,    2,    9,    0,    6,    4,    6,    4,    3,    6,   20,   22,   69,   62,  132, 1866,  210,  268, 2374,  386, 3685};

	//Spectrum 6144 (dim)
	//double K 	= 6144.0;
	//std::vector<int> d = {33 ,34,35, 36, 37,  38, 39};
	//std::vector<int> a = {162, 0, 0, 62, 61, 268, 71};
	//std::vector<int> w = {486, 0, 0,248,183,1072,355};

	//Spectrum 6144 Garello
//	double K 	= 6144.0;
//	std::vector<int> d = {26,32,33};
//	std::vector<int> a = { 1, 1, 1};
//	std::vector<int> w = { 2, 4, 3};
	
//Mix 2 autres
	//double K 	= 6144.0;
	//std::vector<int> d = {26,32,33,36,37,38,39};
	//std::vector<int> a = { 1, 1, 1, 1, 1, 1, 1};
	//std::vector<int> w = { 2, 4, 3, 4, 4, 4, 4};
	
	//double K = 1504.0;	
	//std::vector<int> d = {	 25,   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44};
	//std::vector<int> a = {    1,    0,    0,    1,    1,    1,    3,    1,    3,    8,    2,    9,   13,    3,   18,   29,   25,   32,   52,   42};
	//std::vector<int> w = {    3,    0,    0,    2,    3,    2,    9,    4,    9,   24,    6,   30,   41,   12,   66,  104,  109,  132,  250,  178};


    //NEW ONES

    //double K 	= 528.0;
    //std::vector<int> d = {23,   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
    //std::vector<int> a = {1,    1,    1,    0,    3,    3,    6,    0,    6,    4,   11,   10,   14,   12,   96,  886, 1421,   45,  123,  156,  192,  227,  140,   55,  285,   52,   62};
    //std::vector<int> w = {1,    2,    3,    0,    9,    6,   16,    0,   20,   16,   39,   32,   58,   50,  318, 5268,12535,  210,  779,  864,  984,  982,  850,  286, 1415,  260,  292};
    
    // double K= 1024.0;
	// std::vector<int> d =    {27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
	// std::vector<int> a =    {1,    2,    3,    1,    2,    1,    2,    2,    7,    3,    7,    9,   11,   11,   20,   30,  147,  437,   49,   64,  583,  179,  511};
	// std::vector<int> w =    {1,    4,    9,    2,    6,    2,    6,    6,   21,   12,   27,   32,   43,   44,   78,  142,  719, 1770,  241,  326, 2949, 1148, 3407};

 	// double K= 1504.0;
	// std::vector<int> d =    {25,   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
	// std::vector<int> a =    {1,    0,    0,    1,    1,    1,    2,    1,    2,    5,    1,    6,    7,    3,   14,   13,   17,   22,   32,   28,   47,   49,  185,   91, 1414};
	// std::vector<int> w =    {3,    0,    0,    2,    3,    2,    6,    4,    6,   18,    3,   22,   23,   12,   54,   54,   75,   90,  154,  126,  223,  246,  909,  486, 9696};

	// double K= 2048.0;
	// std::vector<int> d =    {27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
	// std::vector<int> a =    {1,    2,    1,    0,    3,    0,    2,    1,    2,    1,    1,    3,    8,    5,   12,   15,   16,  425,   23,   37,  240,   45,  290};
	// std::vector<int> w =    {1,    4,    3,    0,    9,    0,    6,    4,    6,    4,    3,    8,   26,   20,   44,   62,   72, 1702,  117,  178, 1180,  230, 1872};

 // 	double K= 6144.0;
	// std::vector<int> d =    {26,   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
	// std::vector<int> a =     {1,    0,    0,    0,    0,    0,    1,    1,    1,    0,    1,    1,    1,    2,    3,    7,    9,   10,    6,    8,   10,   21,   20,   25};
	// std::vector<int> w =     {2,    0,    0,    0,    0,    0,    4,    3,    4,    0,    4,    3,    4,    8,   12,   25,   34,   46,   30,   40,   42,   99,  102,  135};

    double K= 1784.0;
	 std::vector<int> d = {34,   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,   49};
	 std::vector<int> a = {1,    0,    0,    7,    4,    2,    5,    2,    5,    4,    3,    6,    7,    4,  713,    8};
	 std::vector<int> w = {2,    0,    0,   17,    9,    6,   13,    5,   14,   18,    6,   19,   39,   21, 4248,   39};

	double SNR;
	int limit;

	if (argc==3){
		SNR = std::strtod(argv[1], NULL);
		limit =  std::min((int)std::stoi(argv[2], nullptr, 0), (int)d.size());		
	}
	else{

		std::cout << "You can choose the SNR value and the number of elements in spectrum \n \
				 (2.0, size) are the default values\n\n";
		SNR = 2.0;
		limit = d.size();
	}
		
	double R    = K/(K*3.0 + 12.0);
	double EbN0 = pow(10.0,SNR/10.0);

	if ( (d.size() != a.size()) || (w.size() != a.size()) || (d.size() != w.size()) ){
		std::cout << "Size of d or A or W are different: d: " << d.size() <<" A: "<< a.size() << " w: " << w.size() <<std::endl;
		exit(0);
	}

	std::cout << "Distribution of errors calculation. "<< std::endl;
	std::cout << "K: " << K << ", SNR: " << SNR <<", Spectrum size: " << limit  << std::endl << std::endl;

	double nom, den;

	den = calcDen(d, a, R, EbN0, limit); 

	for (int i=1; i<11; i++){
		std::cout << "Probabilty CW with " << i << " err:\t";
		nom = calcNom(d, a, w, R, EbN0, i, limit);
 		//std::cout << (int)std::round(nom/den*100) << " %\n";
		std::cout << nom/den*100.0 << " % \n";
	}

	double BEFE = calcBEFE(d,a,w,R,EbN0, limit);
	std::cout << "\nBE/FE expected:\t" << BEFE << "\n";
	
	double FER = calcFER(d,a,R,EbN0, limit);
	std::cout << "FER expected:\t" << FER << "\n\n";

	std::vector<int> avgW;
	for (int i=0; i<limit; i++)
		avgW.push_back((int)std::round((double)w[i]/(double)a[i]));
	std::cout << "Maximum weight: " << avgW[std::distance(avgW.begin(),std::max_element(avgW.begin(), avgW.end()))] << std::endl << std::endl;

	return 0;

}


