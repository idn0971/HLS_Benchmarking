#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#define GETMASK(index, size) (((1 << (size)) - 1) << (index))
#define READFROM(data, index, size) (((data)&GETMASK((index), (size))) >> (index))

//struct decodeResults{
//	int32_t selA,selB,selD,dataImm,
//};
struct aluResults
{
	int32_t aluOut;
	bool memWrite, branch;
};

struct instDecodeResults
{
	uint32_t selA, selB, selD, funct7, funct3, aluop;
	int32_t dataIMM;
	bool branch, aluImm, jumpReg, memWren, memToReg, regDwe;
};

int aluDecode(int32_t opcode, int32_t funct3, int32_t funct7)
{
	int aluOpcode;
	switch (opcode)
	{
	case 51:
		switch (funct7)
		{
		case 0:
			switch (funct3)
			{
			case 0:
				aluOpcode = 0;
				break;
			case 7:
				aluOpcode = 2;
				break;
			case 6:
				aluOpcode = 3;
				break;
			case 4:
				aluOpcode = 4;
				break;
			case 2:
				aluOpcode = 5;
				break;
			case 3:
				aluOpcode = 6;
				break;
			case 5:
				aluOpcode = 9;
				break;
			case 1:
				aluOpcode = 11;
				break;
			default:
				aluOpcode = 31;
				break;
			}
			break;
		case 32:
			switch (funct3)
			{
			case 0:
				aluOpcode = 1;
				break;
			case 5:
				aluOpcode = 7;
				break;
			default:
				aluOpcode = 31;
				break;
			}
			break;
		case 1:
			aluOpcode = 13;
			break;
		default:
			aluOpcode = 31;
			break;
		}
		break;
	case 19:
		switch (funct3)
		{
		case 0:
			aluOpcode = 0;
			break;
		case 7:
			aluOpcode = 2;
			break;
		case 6:
			aluOpcode = 3;
			break;
		case 4:
			aluOpcode = 4;
			break;
		case 2:
			aluOpcode = 5;
			break;
		case 3:
			aluOpcode = 6;
			break;
		case 1:
			aluOpcode = 12;
			break;
		case 5:
			switch (funct7)
			{
			case 32:
				aluOpcode = 8;
				break;
			case 0:
				aluOpcode = 10;
				break;
			default:
				aluOpcode = 31;
				break;
			}
			break;
		default:
			aluOpcode = 31;
			break;
		}
		break;
	case 55:
		aluOpcode = 14;
		break;
	case 23:
		aluOpcode = 15;
		break;
	case 3:
		aluOpcode = 16;
		break;
	case 35:
		aluOpcode = 17;
		break;
	case 111:
		aluOpcode = 18;
		break;
	case 103:
		aluOpcode = 19;
		break;
	case 99:
		switch (funct3)
		{
		case 0:
			aluOpcode = 20;
			break;
		case 1:
			aluOpcode = 21;
			break;
		case 4:
			aluOpcode = 23;
			break;
		case 5:
			aluOpcode = 24;
			break;
		case 6:
			aluOpcode = 25;
			break;
		case 7:
			aluOpcode = 26;
			break;
		default:
			aluOpcode = 31;
			break;
		}
		break;
	default:
		aluOpcode = 31;
		break;
	}
	return aluOpcode;
}

struct instDecodeResults instDecode(int32_t dataInst)
{
	struct instDecodeResults results;
	results.selA = READFROM(dataInst, 15, 5);
	results.selB = READFROM(dataInst, 20, 5);
	results.selD = READFROM(dataInst, 7, 5);
	results.funct7 = READFROM(dataInst, 25, 7);
	results.funct3 = READFROM(dataInst, 12, 3);
	results.aluop = READFROM(dataInst, 0, 7);

	switch (results.aluop)
	{
	case 99:
		if (READFROM(dataInst, 31, 1) == -1)
		{
			results.dataIMM = (0xFFFFF000 | (READFROM(dataInst, 7, 1) << 12) | (READFROM(dataInst, 25, 6) << 5) | (READFROM(dataInst, 8, 4) << 1) | 0);
		}
		else
		{
			results.dataIMM = ((READFROM(dataInst, 31, 1) << 31) | (READFROM(dataInst, 7, 1) << 12) | (READFROM(dataInst, 25, 6) << 5) | (READFROM(dataInst, 8, 4) << 1) | 0);
		}
		break;
	case 111:
		if (READFROM(dataInst, 31, 1) == -1)
		{
			results.dataIMM = (0xFFF00000 | (READFROM(dataInst, 12, 8) << 12) | (READFROM(dataInst, 20, 1) << 11) | (READFROM(dataInst, 25, 6) << 5) | (READFROM(dataInst, 21, 4) << 1) | 0);
		}
		else
		{
			results.dataIMM = ((READFROM(dataInst, 31, 1) << 31) | (READFROM(dataInst, 12, 8) << 12) | (READFROM(dataInst, 20, 1) << 11) | (READFROM(dataInst, 25, 6) << 5) | (READFROM(dataInst, 21, 4) << 1) | 0);
		}
		break;
	case 35:
		if (READFROM(dataInst, 31, 1) == -1)
		{
			results.dataIMM = (0xFFFFF800 | (READFROM(dataInst, 25, 6) << 6) | (READFROM(dataInst, 8, 4) << 1) | READFROM(dataInst, 7, 1));
		}
		else
		{
			results.dataIMM = ((READFROM(dataInst, 31, 1) << 31) | (READFROM(dataInst, 25, 6) << 6) | (READFROM(dataInst, 8, 4) << 1) | READFROM(dataInst, 7, 1));
		}
		break;
	case 55:
	case 23:
		results.dataIMM = (READFROM(dataInst, 12, 20) << 12);
		break;
	default:
		if (READFROM(dataInst, 31, 1) == -1)
		{
			results.dataIMM = (0xFFFFF800 | READFROM(dataInst, 20, 11));
		}
		else
		{
			results.dataIMM = (0x00000000 | READFROM(dataInst, 20, 11));
		}
		break;
	}

	switch (results.aluop)
	{
	case 99:
	case 111:
		results.branch = true;
		results.jumpReg = false;
		break;
	case 103:
		results.branch = false;
		results.jumpReg = true;
		break;
	default:
		results.branch = false;
		results.jumpReg = false;
		break;
	}

	switch (results.aluop)
	{
	case 19:
	case 55:
	case 23:
	case 3:
	case 35:
		results.aluImm = true;
		break;
	default:
		results.aluImm = false;
		break;
	}

	switch (results.aluop)
	{
	case 35:
		results.memWren = true;
		results.memToReg = false;
		break;
	case 3:
		results.memWren = false;
		results.memToReg = true;
		break;
	default:
		results.memWren = false;
		results.memToReg = false;
		break;
	}

	switch (results.aluop)
	{
	case 99:
	case 35:
		results.regDwe = false;
		break;
	default:
		results.regDwe = true;
		break;
	}
	return results;
}

//Binary to Decimal converter
/*int BTD(int binary_val){
	int decimal_val = 0, base = 1, rem;
        while (num > 0)
    {
        rem = num % 10;
        decimal_val = decimal_val + rem * base;
        num = num / 10 ;
        base = base * 2;
    }
	return decimal_val;
}*/

struct aluResults alu(int32_t A, int32_t B, int OP, int imm, int32_t pc)
{
	struct aluResults results;
	int temp;

	switch (OP)
	{
	case 0:
		results.aluOut = A + B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 1:
		results.aluOut = A - B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 2:
		results.aluOut = A & B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 3:
		results.aluOut = A | B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 4:
		results.aluOut = A ^ B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 5:
		if (A < B)
		{
			results.aluOut = 1;
		}
		else
			results.aluOut = 0;
		results.branch = false;
		results.memWrite = false;
		break;

	case 6:
		if ((uint32_t)A < (uint32_t)B)
		{
			results.aluOut = 1;
		}
		else
			results.aluOut = 0;
		results.branch = false;
		results.memWrite = false;
		break;
	case 7:
		temp = READFROM(B, 0, 5);
		results.aluOut = A >> B;
		results.branch = false;
		results.memWrite = false;
		break;

	case 8:
		results.aluOut = A >> (uint32_t)imm;
		results.branch = false;
		results.memWrite = false;
		break;

	case 9:
		temp = READFROM(B, 0, 5);
		results.aluOut = (uint32_t)A >> B;
		results.branch = false;
		results.memWrite = false;
		break;

	case 10:
		results.aluOut = (uint32_t)A >> (uint32_t)imm;
		results.branch = false;
		results.memWrite = false;
		break;
	case 11:
		temp = READFROM(B, 0, 5);
		results.aluOut = (uint32_t)A << B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 12:
		results.aluOut = (uint32_t)A << (uint32_t)imm;
		results.branch = false;
		results.memWrite = false;
		break;
	case 13:
		results.aluOut = A * B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 14:
		results.aluOut = B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 15:
		results.aluOut = pc + B;
		results.branch = false;
		results.memWrite = false;
		break;
	case 16:
	case 17:
		results.aluOut = A + B;
		results.branch = false;
		results.memWrite = true;
		break;
	case 18:
	case 19:
		results.aluOut = pc + 4;
		results.branch = true;
		results.memWrite = false;
		break;
	case 20:
		results.memWrite = false;
		if (A == B)
			results.branch = true;
		else
			results.branch = false;
		results.aluOut = 0;
		break;
	case 21:
		results.memWrite = false;
		if (A != B)
			results.branch = true;
		else
			results.branch = false;
		results.aluOut = 0;
		break;

	case 23:
		results.memWrite = false;
		if (A < B)
			results.branch = true;
		else
			results.branch = false;
		results.aluOut = 0;
		break;
	case 24:
		results.memWrite = false;
		if (A >= B)
			results.branch = true;
		else
			results.branch = false;
		results.aluOut = 0;
		break;
	case 25:
		results.memWrite = false;
		if ((uint32_t)A < (uint32_t)B)
			results.branch = true;
		else
			results.branch = false;
		results.aluOut = 0;
		break;
	case 26:
		results.memWrite = false;
		if ((uint32_t)A >= (uint32_t)B)
			results.branch = true;
		else
			results.branch = false;
		results.aluOut = 0;
		break;
	default:
		results.aluOut = 0;
		results.branch = false;
		results.memWrite = false;
		break;
	}
	return results;
}

int32_t addressCalculator(int32_t dataImm, bool branchAlu, bool branchControl, bool jumpReg, int32_t dataA, int32_t pc)
{
	int32_t newPc;
	if (branchAlu == true)
	{
		if (branchControl == true)
		{
			newPc = pc + dataImm;
		}
		else if (jumpReg == true)
		{
			newPc = ((dataA + dataImm) & 0xfffffffe);
		}
		else
		{
			newPc = pc + 4;
		}
	}
	else
	{
		newPc = pc + 4;
	}
	return newPc;
}

int main()
{
	int32_t registers[32] = {0};
	int32_t instMemory[1024] = {[0] = 0x20000113, [4] = 0x00400513, [8] = 0x008000ef, [12] = 0x0400006f, [16] = 0xff810113, [20] = 0x00112223, [24] = 0x00a12023, [28] = 0x00100293,
[32] = 0x00555463, [36] = 0x0180006f, [40] = 0xfff50513, [44] = 0xfe5ff0ef, [48] = 0x00012583, [52] = 0x02b50533, [56] = 0x0080006f, [60] = 0x00100513, [64] = 0x00412083, [68] = 0x00810113,
[72] = 0x00008067, [76] = 0x00a00b33};	
	int32_t memory[8192];
	int32_t currInst = 0;
	int32_t nextInst = 0;
	int aluOpcode;
	struct aluResults aluResult;
	struct instDecodeResults instDecodeResult;
	int32_t aluA, aluB;

	while (instMemory[currInst] != 0 && currInst < 1024)
	{
		registers[0] = 0;
		currInst = nextInst;
		instDecodeResult = instDecode(instMemory[currInst]);
		aluOpcode = aluDecode(instDecodeResult.aluop, instDecodeResult.funct3, instDecodeResult.funct7);
		aluA = registers[instDecodeResult.selA];
		if (instDecodeResult.aluImm == true)
		{
			aluB = instDecodeResult.dataIMM;
		}
		else
		{
			aluB = registers[instDecodeResult.selB];
		}
		aluResult = alu(aluA, aluB, aluOpcode, instDecodeResult.selB, currInst);
		if (aluResult.memWrite == true && instDecodeResult.memWren == true )
		{
			memory[aluResult.aluOut] = registers[instDecodeResult.selB];
		}
		if (instDecodeResult.memToReg == true)
		{
			registers[instDecodeResult.selD] = memory[aluResult.aluOut];
		}
		else if(instDecodeResult.regDwe == true)
		{
			registers[instDecodeResult.selD] = aluResult.aluOut;
		}
		nextInst = addressCalculator(instDecodeResult.dataIMM, aluResult.branch, instDecodeResult.branch, instDecodeResult.jumpReg, aluA, currInst);
	}
	printf("%d\n", registers[22]);
}
