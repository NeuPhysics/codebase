(* ::Package:: *)

BeginPackage["neutrino`"]

(*Unit Conversion*)


(*Rotation Matrices*)


(*Stimulated Matter Effect*)

(*Parameters*)

(*Parameters END*)


(*2-Frequency Matter Perturbation*)
bCoef::usage = "Takes six parameters [n1,n2,k1,k2,a1,a2] and returns the coefficient labeled by n1, n2. In a 2-frequency Hamiltonian";
coefDenPlt::usage = "Takes six parameters [k1,k2,a1,a2,thetam,range] and returns four density plots of the Abs@phases and Abs@coefficients as a function of n1 and n2";
coefDenPltReIm::usage = "Takes six parameters [k1,k2,a1,a2,thetam,range] and returns four density plots of the Re@coefficients and Im@coefficients as a function of n1 and n";
coefSlicings::usage = "The Abs@coefficient values through some lines on the n1-n2 plane.";

Begin["`Private`"]

phi1V=0;
phi2V=0;
imgsize=700;

bCoef[n1_,n2_,k1_,k2_,a1_,a2_,thetam_]:=-(-I)^(n1+n2) Tan[2thetam]/2 n1 k1 BesselJ[n1,a1/k1 Cos[2thetam]]BesselJ[n2,a2/k2 Cos[2thetam]]

coefDenPlt[k1_,k2_,a1_,a2_,thetam_,range_]:=Module[{n1M,n2M,k1M,k2M,a1M,a2M,thetamM,phaseList,coeffList,coeffListRe,coeffListIm,coeffListAbs,list0,list1,list2,list3,list4,n2List1,n1List2,n2List3,n1List4,meshStyle,parList},
meshStyle=None;
k1M=k1;
k2M=k2;
a1M=a1;
a2M=a2;
thetamM=thetam;

phaseList=Flatten[Table[{n1,n2,Abs[n1 k1M+ n2 k2M-1]},{n1,-range,range},{n2,-range,range}],1];
coeffList=Flatten[Table[{n1,n2,bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]},{n1,-range,range},{n2,-range,range}],1];
coeffListRe=Flatten[Table[{n1,n2,Log@Re[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
coeffListIm=Flatten[Table[{n1,n2,Log@Im[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
coeffListAbs=Flatten[Table[{n1,n2,Log@Abs[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
lineRWA=Table[{n1,Round[(1-n1 k1M)/k2M]},{n1,-range,range}];

parList=Text["Parameters:\n k1="<>ToString[k1M]<>";\n k2="<>ToString[k2M]<>";\n a1="<>ToString[a1M]<>";\n a2="<>ToString[a2M]<>";\n\n"];

Grid[
{{
Show[ListDensityPlot[phaseList,Mesh->meshStyle,FrameLabel->{"n1","n2"},ColorFunction->"AvocadoColors",PlotLegends->All,ImageSize->imgsize,PlotLabel->"Phases" ,InterpolationOrder->0],ListPlot[lineRWA,ImageSize->imgsize,PlotRange->{{-range,range},{-range,range}}]]
,
Show[ListDensityPlot[coeffListAbs,Mesh->meshStyle,FrameLabel->{"n1","n2"},ColorFunction->"AvocadoColors",PlotLegends->All,ImageSize->imgsize,PlotLabel->"Absolute Value of The Coefficient" ,InterpolationOrder->0],ListPlot[lineRWA,ImageSize->imgsize,PlotRange->{{-range,range},{-range,range}}]]
}}
]
]

coefDenPltReIm[k1_,k2_,a1_,a2_,thetam_,range_]:=Module[{n1M,n2M,k1M,k2M,a1M,a2M,thetamM,phaseList,coeffList,coeffListRe,coeffListIm,coeffListAbs,list0,list1,list2,list3,list4,n2List1,n1List2,n2List3,n1List4,meshStyle,parList},
meshStyle=None;
k1M=k1;
k2M=k2;
a1M=a1;
a2M=a2;
thetamM=thetam;

phaseList=Flatten[Table[{n1,n2,Abs[n1 k1M+ n2 k2M-1]},{n1,-range,range},{n2,-range,range}],1];
coeffList=Flatten[Table[{n1,n2,bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]},{n1,-range,range},{n2,-range,range}],1];
coeffListRe=Flatten[Table[{n1,n2,Log@Re[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
coeffListIm=Flatten[Table[{n1,n2,Log@Im[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
coeffListAbs=Flatten[Table[{n1,n2,Log@Abs[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
lineRWA=Table[{n1,Round[(1-n1 k1M)/k2M]},{n1,-range,range}];

parList=Text["Parameters:\n k1="<>ToString[k1M]<>";\n k2="<>ToString[k2M]<>";\n a1="<>ToString[a1M]<>";\n a2="<>ToString[a2M]<>";\n\n"];

Grid[
{{
Show[ListDensityPlot[coeffListRe,Mesh->meshStyle,FrameLabel->{"n1","n2"},ColorFunction->"AvocadoColors",PlotLegends->All,ImageSize->imgsize,PlotLabel->"Real Part of The Coefficient" ,InterpolationOrder->0],ListPlot[lineRWA,ImageSize->imgsize,PlotRange->{{-range,range},{-range,range}}]],
Show[ListDensityPlot[coeffListIm,Mesh->meshStyle,FrameLabel->{"n1","n2"},ColorFunction->"AvocadoColors",PlotLegends->All,ImageSize->imgsize,PlotLabel->"Imaginary Part of The Coefficient" ,InterpolationOrder->0],ListPlot[lineRWA,ImageSize->imgsize,PlotRange->{{-range,range},{-range,range}}]]
}}
]
]


coefSlicings[k1_,k2_,a1_,a2_,thetam_,range_,range2_]:=Module[{n1M,n2M,k1M,k2M,a1M,a2M,thetamM,coeffList,coeffListRe,coeffListIm,coeffListAbs,list0,list02,list1,list2,list3,list4,n2List1,n1List2,n2List3,n1List4,meshStyle},
meshStyle=None;
k1M=k1;
k2M=k2;
a1M=a1;
a2M=a2;
thetamM=thetam;

coeffList=Flatten[Table[{n1,n2,bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]},{n1,-range,range},{n2,-range,range}],1];
coeffListRe=Flatten[Table[{n1,n2,Log@Re[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
coeffListIm=Flatten[Table[{n1,n2,Log@Im[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
coeffListAbs=Flatten[Table[{n1,n2,Log@Abs[bCoef[n1,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range},{n2,-range,range}],1];
list0=Table[{n1,Abs[bCoef[n1,Round[(1-n1 k1M)/k2M],k1M,k2M,a1M,a2M,thetamM]+bCoef[Round[(1-n1 k1M)/k2M],n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range}];
list02=Table[{n1,Abs[bCoef[n1,Round[(1-n1 k1M)/k2M],k1M,k2M,a1M,a2M,thetamM]+bCoef[Round[(1-n1 k1M)/k2M],n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range2,range2}];
n2List1=0;
list1=Table[{n1,Abs[bCoef[n1,n2List1,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2List1,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range}];
n1List2=0;
list2=Table[{n2,Abs[bCoef[n1List2,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1List2,k2M,k1M,a2M,a1M,thetamM]]},{n2,-range,range}];
n2List3=Round[range/2];
list3=Table[{n1,Abs[bCoef[n1,n2List3,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2List3,n1,k2M,k1M,a2M,a1M,thetamM]]},{n1,-range,range}];
n1List4=Round[range/2];
list4=Table[{n2,Abs[bCoef[n1List4,n2,k1M,k2M,a1M,a2M,thetamM]+bCoef[n2,n1List4,k2M,k1M,a2M,a1M,thetamM]]},{n2,-range,range}];



Grid[{{ListLogPlot[list0,ImageSize->imgsize,Frame->True,PlotLabel->"Slicings",Joined->True,PlotStyle->{Dotted,Red},PlotMarkers->{Automatic, Small},PlotLegends->Placed[{"RWA"},{Top,Center}],PlotRange->{{-range2,range2},Automatic},GridLines->{{{Round[1/k1M],Dashed},{Round[(1-Round[1/k2M] k2M)/k1M],Red}}, {1}}]
,
ListLogPlot[{list0,list1,list2,list3,list4},ImageSize->imgsize,Frame->True,PlotLabel->"Slicings",Joined->True,PlotStyle->{{Dotted,Red},Blue,Black,Gray,Magenta},PlotMarkers->{Automatic, Small},PlotLegends->Placed[{"RWA","n2="<>ToString[n2List1],"n1="<>ToString[n1List2],"n2="<>ToString[n2List3],"n1="<>ToString[n1List4]},{Top,Center}]]}}]

]



End[]
(*2-Frequency Matter Perturbation END*)


EndPackage[]
