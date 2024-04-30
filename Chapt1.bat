mkdir Labs\PZ-23-3\Kravchenko_Ruslan\batch\not_a_hiden
mkdir Labs\PZ-23-3\Kravchenko_Ruslan\batch\hiden
ATTRIB +h Labs\PZ-23-3\Kravchenko_Ruslan\batch\hiden
xcopy /? > Labs\PZ-23-3\Kravchenko_Ruslan\batch\not_a_hiden\copyhelp.txt
xcopy Labs\PZ-23-3\Kravchenko_Ruslan\batch\not_a_hiden\copyhelp.txt Labs\PZ-23-3\Kravchenko_Ruslan\batch\hiden\copied_copyhelp.txt