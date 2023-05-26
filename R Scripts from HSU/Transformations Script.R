Dataset$var_STND <- with(Dataset, (Variable - mean(Variable)) / sd(Variable))

Dataset$var_INV<- with(Dataset, 1/Variable)

Dataset$var_INV1<- with(Dataset, 1/(Variable+1))

Dataset$var_REF<- with(Dataset, max(Variable) - Variable)

Dataset$var_REF1<- with(Dataset, max(Variable) - Variable + 1)

Dataset$var_InvRef<- with(Dataset, 1/(max(Variable) - Variable))

Dataset$var_InvRef1<- with(Dataset, 1/(max(Variable) - Variable + 1))

Dataset$var_SQRT<- with(Dataset, Variable^0.5)

Dataset$var_InvSQRT<- with(Dataset, 1/(Variable^0.5))

Dataset$var_RefSQRT<- with(Dataset, (max(Variable) - Variable)^0.5)

Dataset$var_InvRefSQRT<- with(Dataset, 1/((max(Variable) - Variable)^0.5))

Dataset$var_SQRT1 <- with(Dataset, (Variable + 1)^0.5)

Dataset$var_InvSQRT1 <- with(Dataset, 1/((Variable + 1)^0.5))

Dataset$var_RefSQRT1 <- with(Dataset, (max(Variable) - Variable +1 )^0.5)

Dataset$var_InvRefSQRT1 <- with(Dataset, 1/((max(Variable) - Variable +1) ^0.5))

Dataset$var_CubeRoot<- with(Dataset, Variable^(1/3))

Dataset$var_InvCubeRoot<- with(Dataset, 1/(Variable^(1/3)))

Dataset$var_RefCubeRoot<- with(Dataset, (max(Variable) - Variable)^(1/3))

Dataset$var_InvRefCubeRoot<- with(Dataset, 1/(max(Variable) - Variable)^(1/3))

Dataset$var_CubeRoot1<- with(Dataset, (Variable + 1)^(1/3))

Dataset$var_InvCubeRoot1<- with(Dataset, 1/((Variable + 1)^(1/3)))

Dataset$var_RefCubeRoot1<- with(Dataset, (max(Variable) - Variable +1)^(1/3))

Dataset$var_InvRefCubeRoot1<- with(Dataset, 1/((max(Variable) - Variable +1)^(1/3)))

Dataset$var_Squared <- with(Dataset, Variable^2)

Dataset$var_InvSquared <- with(Dataset, 1/(Variable^2))

Dataset$var_RefSquared <- with(Dataset, (max(Variable) - Variable)^2)

Dataset$var_InvRefSquared <- with(Dataset, 1/((max(Variable) - Variable)^2))

Dataset$var_Cubed <- with(Dataset, Variable^3)

Dataset$var_InvCubed <- with(Dataset, 1/(Variable^3))

Dataset$var_RefCubed <- with(Dataset, (max(Variable) - Variable)^3)

Dataset$var_InvRefCubed <- with(Dataset, 1/((max(Variable) - Variable)^3))

Dataset$var_LN <- with(Dataset, log(Variable))

Dataset$var_InvLN <- with(Dataset, 1/log(Variable))

Dataset$var_RefLN <- with(Dataset, log(max(Variable) - Variable))

Dataset$var_InvRefLN <- with(Dataset, 1/log(max(Variable) - Variable))

Dataset$var_LN1 <- with(Dataset, log(Variable+1))

Dataset$var_InvLN1 <- with(Dataset, 1/log(Variable+1))

Dataset$var_RefLN1 <- with(Dataset, log(max(Variable) - Variable + 1))

Dataset$var_InvRefLN1 <- with(Dataset, 1/log(max(Variable) - Variable+1))

Dataset$var_LN16 <- with(Dataset, log(Variable+1/6))

Dataset$var_InvLN16 <- with(Dataset, 1/log(Variable+1/6))

Dataset$var_RefLN16 <- with(Dataset, log(max(Variable) - Variable+1/6))

Dataset$var_InvRefLN16 <- with(Dataset, 1/log(max(Variable) - Variable+1/6))

Dataset$var_log <- with(Dataset, log10(Variable))

Dataset$var_InvLog <- with(Dataset, 1/log10(Variable))

Dataset$var_RefLog <- with(Dataset, log10(max(Variable) - Variable))

Dataset$var_InvRefLog <- with(Dataset, 1/log10(max(Variable) - Variable))

Dataset$var_log1 <- with(Dataset, log10(Variable+1))

Dataset$var_InvLog1 <- with(Dataset, 1/log10(Variable+1))

Dataset$var_RefLog1 <- with(Dataset, log10(max(Variable) - Variable+1))

Dataset$var_InvRefLog1 <- with(Dataset, 1/log10(max(Variable) - Variable+1))

Dataset$var_log16 <- with(Dataset, log10(Variable+1/6))

Dataset$var_InvLog16 <- with(Dataset, 1/log10(Variable+1/6))

Dataset$var_RefLog16 <- with(Dataset, log10(max(Variable) - Variable+1/6))

Dataset$var_InvRefLog16 <- with(Dataset, 1/log10(max(Variable) - Variable+1/6))

Dataset$var_log2 <- with(Dataset, log2(Variable))

Dataset$var_InvLog2 <- with(Dataset, 1/log2(Variable))

Dataset$var_RefLog2 <- with(Dataset, log2(max(Variable) - Variable))

Dataset$var_InvRefLog2 <- with(Dataset, 1/log2(max(Variable) - Variable))

Dataset$var_log2_1 <- with(Dataset, log2(Variable+1))

Dataset$var_InvLog2_1 <- with(Dataset, 1/log2(Variable+1))

Dataset$var_RefLog2_1 <- with(Dataset, log2(max(Variable) - Variable+1))

Dataset$var_InvRefLog2_1 <- with(Dataset, 1/log2(max(Variable) - Variable+1))

Dataset$var_log2_16 <- with(Dataset, log2(Variable+1/6))

Dataset$var_InvLog2_16 <- with(Dataset, 1/log2(Variable+1/6))

Dataset$var_RefLog2_16 <- with(Dataset, log2(max(Variable) - Variable + 1/6))

Dataset$var_InvRefLog2_16 <- with(Dataset, 1/log2(max(Variable) - Variable + 1/6))

Dataset$var_sin <- with(Dataset, sin(Variable))

Dataset$var_Invsin <- with(Dataset, 1/sin(Variable))

Dataset$var_Refsin <- with(Dataset, sin(max(Variable) - Variable))

Dataset$var_InvRefsin <- with(Dataset, 1/sin(max(Variable) - Variable))

Dataset$var_sinpi <- with(Dataset, sinpi(Variable))

Dataset$var_Invsinpi <- with(Dataset, 1/sinpi(Variable))

Dataset$var_Refsinpi <- with(Dataset, sinpi(max(Variable) - Variable))

Dataset$var_InvRefsinpi <- with(Dataset, 1/sinpi(max(Variable) - Variable))

Dataset$var_asin <- with(Dataset, asin(Variable))

Dataset$var_Invasin <- with(Dataset, 1/asin(Variable))

Dataset$var_Refasin <- with(Dataset, asin(max(Variable) - Variable))

Dataset$var_InvRefasin <- with(Dataset, 1/asin(max(Variable) - Variable))

Dataset$var_cos <- with(Dataset, cos(Variable))

Dataset$var_Invcos <- with(Dataset, cos(Variable))

Dataset$var_Refcos <- with(Dataset, cos(max(Variable) - Variable))

Dataset$var_InvRefcos <- with(Dataset, cos(max(Variable) - Variable))

Dataset$var_cospi <- with(Dataset, cospi(Variable))

Dataset$var_Invcospi <- with(Dataset, cospi(Variable))

Dataset$var_Refcospi <- with(Dataset, cospi(max(Variable) - Variable))

Dataset$var_InvRefcospi <- with(Dataset, cospi(max(Variable) - Variable))

Dataset$var_acos <- with(Dataset, acos(Variable))

Dataset$var_Invacos <- with(Dataset, acos(Variable))

Dataset$var_Refacos <- with(Dataset, acos(max(Variable) - Variable))

Dataset$var_InvRefacos <- with(Dataset, acos(max(Variable) - Variable))

Dataset$var_tan <- with(Dataset, tan(Variable))

Dataset$var_Invtan <- with(Dataset, tan(Variable))

Dataset$var_Reftan <- with(Dataset, tan(max(Variable) - Variable))

Dataset$var_InvReftan <- with(Dataset, tan(max(Variable) - Variable))

Dataset$var_tanpi <- with(Dataset, tanpi(Variable))

Dataset$var_Invtanpi <- with(Dataset, tanpi(Variable))

Dataset$var_Reftanpi <- with(Dataset, tanpi(max(Variable) - Variable))

Dataset$var_InvReftanpi <- with(Dataset, tanpi(max(Variable) - Variable))


Dataset$var_tanpi2 <- with(Dataset, tan(Variable*pi + pi / 2))

Dataset$var_Invtanpi2 <- with(Dataset, tan(Variable*pi + pi / 2))

Dataset$var_Reftanpi2 <- with(Dataset, tan((max(Variable) - Variable)*pi + pi / 2))

Dataset$var_InvReftanpi2 <- with(Dataset, tan((max(Variable) - Variable) * pi + pi / 2))

Dataset$var_atan <- with(Dataset, atan(Variable))

Dataset$var_Invatan <- with(Dataset, atan(Variable))

Dataset$var_Refatan <- with(Dataset, atan(max(Variable) - Variable))

Dataset$var_InvRefatan <- with(Dataset, atan(max(Variable) - Variable))

Dataset$var_atanpi <- with(Dataset, atan(Variable*pi + pi / 2))

Dataset$var_Invatanpi <- with(Dataset, atan(Variable*pi + pi / 2))

Dataset$var_Refatanpi <- with(Dataset, atan((max(Variable) - Variable)*pi + pi / 2))

Dataset$var_InvRefatanpi <- with(Dataset, atan((max(Variable) - Variable)*pi + pi / 2))
