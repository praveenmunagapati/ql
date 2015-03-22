%{

//TODO Put your favorite license here
		
// yacc source generated by ebnf2y[1]
// at 2015-03-22 16:38:55.296017567 +0100 CET
//
//  $ ebnf2y -o ql.y -oe ql.ebnf -start StatementList -pkg ql -p _
//
// CAUTION: If this file is a Go source file (*.go), it was generated
// automatically by '$ go tool yacc' from a *.y file - DO NOT EDIT in that case!
// 
//   [1]: http://github.com/cznic/ebnf2y

package ql //TODO real package name

//TODO required only be the demo _dump function
import (
	"bytes"
	"fmt"
	"strings"

	"github.com/cznic/strutil"
)

%}

%union {
	item interface{} //TODO insert real field(s)
}

%token	_ANDAND
%token	_ANDNOT
%token	_EQ
%token	_FLOAT_LIT
%token	_GE
%token	_IDENTIFIER
%token	_IMAGINARY_LIT
%token	_INT_LIT
%token	_LE
%token	_LSH
%token	_NEQ
%token	_OROR
%token	_QL_PARAMETER
%token	_RSH
%token	_RUNE_LIT
%token	_STRING_LIT

%type	<item> 	/*TODO real type(s), if/where applicable */
	_ANDAND
	_ANDNOT
	_EQ
	_FLOAT_LIT
	_GE
	_IDENTIFIER
	_IMAGINARY_LIT
	_INT_LIT
	_LE
	_LSH
	_NEQ
	_OROR
	_QL_PARAMETER
	_RSH
	_RUNE_LIT
	_STRING_LIT

%token _ADD
%token _ALTER
%token _AND
%token _AS
%token _ASC
%token _BEGIN
%token _BETWEEN
%token _BIGINT
%token _BIGRAT
%token _BLOB
%token _BOOL
%token _BY
%token _BYTE
%token _COLUMN
%token _COMMIT
%token _COMPLEX128
%token _COMPLEX64
%token _CREATE
%token _DELETE
%token _DESC
%token _DISTINCT
%token _DROP
%token _DURATION
%token _EXISTS
%token _FALSE
%token _FLOAT
%token _FLOAT32
%token _FLOAT64
%token _FROM
%token _GROUPBY
%token _ID
%token _IF
%token _IN
%token _INDEX
%token _INSERT
%token _INT
%token _INT16
%token _INT32
%token _INT64
%token _INT8
%token _INTO
%token _IS
%token _LIKE
%token _LIMIT
%token _NOT
%token _NULL
%token _OFFSET
%token _ON
%token _OR
%token _ORDER
%token _ROLLBACK
%token _RUNE
%token _SELECT
%token _SET
%token _STRING
%token _TABLE
%token _TIME
%token _TRANSACTION
%token _TRUE
%token _TRUNCATE
%token _UINT
%token _UINT16
%token _UINT32
%token _UINT64
%token _UINT8
%token _UNIQUE
%token _UPDATE
%token _VALUES
%token _WHERE

%type	<item> 	/*TODO real type(s), if/where applicable */
	AlterTableStmt
	AlterTableStmt1
	Assignment
	AssignmentList
	AssignmentList1
	AssignmentList2
	BeginTransactionStmt
	Call
	Call1
	ColumnDef
	ColumnName
	ColumnNameList
	ColumnNameList1
	ColumnNameList2
	CommitStmt
	Conversion
	CreateIndexStmt
	CreateIndexStmt1
	CreateIndexStmt2
	CreateIndexStmt3
	CreateTableStmt
	CreateTableStmt1
	CreateTableStmt2
	CreateTableStmt3
	DeleteFromStmt
	DeleteFromStmt1
	DropIndexStmt
	DropIndexStmt1
	DropTableStmt
	DropTableStmt1
	EmptyStmt
	Expression
	Expression1
	Expression11
	ExpressionList
	ExpressionList1
	ExpressionList2
	Factor
	Factor1
	Factor11
	Factor2
	Field
	Field1
	FieldList
	FieldList1
	FieldList2
	GroupByClause
	Index
	IndexName
	InsertIntoStmt
	InsertIntoStmt1
	InsertIntoStmt2
	Limit
	Literal
	Offset
	Operand
	OrderBy
	OrderBy1
	OrderBy11
	Predicate
	Predicate1
	Predicate11
	Predicate12
	Predicate13
	PrimaryExpression
	PrimaryFactor
	PrimaryFactor1
	PrimaryFactor11
	PrimaryTerm
	PrimaryTerm1
	PrimaryTerm11
	QualifiedIdent
	QualifiedIdent1
	RecordSet
	RecordSet1
	RecordSet11
	RecordSet2
	RecordSetList
	RecordSetList1
	RecordSetList2
	RollbackStmt
	SelectStmt
	SelectStmt1
	SelectStmt2
	SelectStmt3
	SelectStmt4
	SelectStmt5
	SelectStmt6
	SelectStmt7
	Slice
	Slice1
	Slice2
	Start
	Statement
	StatementList
	StatementList1
	TableName
	Term
	Term1
	Term11
	TruncateTableStmt
	Type
	UnaryExpr
	UnaryExpr1
	UnaryExpr11
	UpdateStmt
	UpdateStmt1
	UpdateStmt2
	Values
	Values1
	Values2
	WhereClause

/*TODO %left, %right, ... declarations */

%start Start

%%

AlterTableStmt:
	_ALTER _TABLE TableName AlterTableStmt1
	{
		$$ = []AlterTableStmt{"ALTER", "TABLE", $3, $4} //TODO 1
	}

AlterTableStmt1:
	_ADD ColumnDef
	{
		$$ = []AlterTableStmt1{"ADD", $2} //TODO 2
	}
|	_DROP _COLUMN ColumnName
	{
		$$ = []AlterTableStmt1{"DROP", "COLUMN", $3} //TODO 3
	}

Assignment:
	ColumnName '=' Expression
	{
		$$ = []Assignment{$1, "=", $3} //TODO 4
	}

AssignmentList:
	Assignment AssignmentList1 AssignmentList2
	{
		$$ = []AssignmentList{$1, $2, $3} //TODO 5
	}

AssignmentList1:
	/* EMPTY */
	{
		$$ = []AssignmentList1(nil) //TODO 6
	}
|	AssignmentList1 ',' Assignment
	{
		$$ = append($1.([]AssignmentList1), ",", $3) //TODO 7
	}

AssignmentList2:
	/* EMPTY */
	{
		$$ = nil //TODO 8
	}
|	','
	{
		$$ = "," //TODO 9
	}

BeginTransactionStmt:
	_BEGIN _TRANSACTION
	{
		$$ = []BeginTransactionStmt{"BEGIN", "TRANSACTION"} //TODO 10
	}

Call:
	'(' Call1 ')'
	{
		$$ = []Call{"(", $2, ")"} //TODO 11
	}

Call1:
	/* EMPTY */
	{
		$$ = nil //TODO 12
	}
|	ExpressionList
	{
		$$ = $1 //TODO 13
	}

ColumnDef:
	ColumnName Type
	{
		$$ = []ColumnDef{$1, $2} //TODO 14
	}

ColumnName:
	_IDENTIFIER
	{
		$$ = $1 //TODO 15
	}

ColumnNameList:
	ColumnName ColumnNameList1 ColumnNameList2
	{
		$$ = []ColumnNameList{$1, $2, $3} //TODO 16
	}

ColumnNameList1:
	/* EMPTY */
	{
		$$ = []ColumnNameList1(nil) //TODO 17
	}
|	ColumnNameList1 ',' ColumnName
	{
		$$ = append($1.([]ColumnNameList1), ",", $3) //TODO 18
	}

ColumnNameList2:
	/* EMPTY */
	{
		$$ = nil //TODO 19
	}
|	','
	{
		$$ = "," //TODO 20
	}

CommitStmt:
	_COMMIT
	{
		$$ = "COMMIT" //TODO 21
	}

Conversion:
	Type '(' Expression ')'
	{
		$$ = []Conversion{$1, "(", $3, ")"} //TODO 22
	}

CreateIndexStmt:
	_CREATE CreateIndexStmt1 _INDEX CreateIndexStmt2 IndexName _ON TableName '(' CreateIndexStmt3 ')'
	{
		$$ = []CreateIndexStmt{"CREATE", $2, "INDEX", $4, $5, "ON", $7, "(", $9, ")"} //TODO 23
	}

CreateIndexStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 24
	}
|	_UNIQUE
	{
		$$ = "UNIQUE" //TODO 25
	}

CreateIndexStmt2:
	/* EMPTY */
	{
		$$ = nil //TODO 26
	}
|	_IF _NOT _EXISTS
	{
		$$ = []CreateIndexStmt2{"IF", "NOT", "EXISTS"} //TODO 27
	}

CreateIndexStmt3:
	ColumnName
	{
		$$ = $1 //TODO 28
	}
|	_ID Call
	{
		$$ = []CreateIndexStmt3{"id", $2} //TODO 29
	}

CreateTableStmt:
	_CREATE _TABLE CreateTableStmt1 TableName '(' ColumnDef CreateTableStmt2 CreateTableStmt3 ')'
	{
		$$ = []CreateTableStmt{"CREATE", "TABLE", $3, $4, "(", $6, $7, $8, ")"} //TODO 30
	}

CreateTableStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 31
	}
|	_IF _NOT _EXISTS
	{
		$$ = []CreateTableStmt1{"IF", "NOT", "EXISTS"} //TODO 32
	}

CreateTableStmt2:
	/* EMPTY */
	{
		$$ = []CreateTableStmt2(nil) //TODO 33
	}
|	CreateTableStmt2 ',' ColumnDef
	{
		$$ = append($1.([]CreateTableStmt2), ",", $3) //TODO 34
	}

CreateTableStmt3:
	/* EMPTY */
	{
		$$ = nil //TODO 35
	}
|	','
	{
		$$ = "," //TODO 36
	}

DeleteFromStmt:
	_DELETE _FROM TableName DeleteFromStmt1
	{
		$$ = []DeleteFromStmt{"DELETE", "FROM", $3, $4} //TODO 37
	}

DeleteFromStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 38
	}
|	WhereClause
	{
		$$ = $1 //TODO 39
	}

DropIndexStmt:
	_DROP _INDEX DropIndexStmt1 IndexName
	{
		$$ = []DropIndexStmt{"DROP", "INDEX", $3, $4} //TODO 40
	}

DropIndexStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 41
	}
|	_IF _EXISTS
	{
		$$ = []DropIndexStmt1{"IF", "EXISTS"} //TODO 42
	}

DropTableStmt:
	_DROP _TABLE DropTableStmt1 TableName
	{
		$$ = []DropTableStmt{"DROP", "TABLE", $3, $4} //TODO 43
	}

DropTableStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 44
	}
|	_IF _EXISTS
	{
		$$ = []DropTableStmt1{"IF", "EXISTS"} //TODO 45
	}

EmptyStmt:
	/* EMPTY */
	{
		$$ = nil //TODO 46
	}

Expression:
	Term Expression1
	{
		$$ = []Expression{$1, $2} //TODO 47
	}

Expression1:
	/* EMPTY */
	{
		$$ = []Expression1(nil) //TODO 48
	}
|	Expression1 Expression11 Term
	{
		$$ = append($1.([]Expression1), $2, $3) //TODO 49
	}

Expression11:
	_OROR
	{
		$$ = $1 //TODO 50
	}
|	_OR
	{
		$$ = "OR" //TODO 51
	}

ExpressionList:
	Expression ExpressionList1 ExpressionList2
	{
		$$ = []ExpressionList{$1, $2, $3} //TODO 52
	}

ExpressionList1:
	/* EMPTY */
	{
		$$ = []ExpressionList1(nil) //TODO 53
	}
|	ExpressionList1 ',' Expression
	{
		$$ = append($1.([]ExpressionList1), ",", $3) //TODO 54
	}

ExpressionList2:
	/* EMPTY */
	{
		$$ = nil //TODO 55
	}
|	','
	{
		$$ = "," //TODO 56
	}

Factor:
	PrimaryFactor Factor1 Factor2
	{
		$$ = []Factor{$1, $2, $3} //TODO 57
	}

Factor1:
	/* EMPTY */
	{
		$$ = []Factor1(nil) //TODO 58
	}
|	Factor1 Factor11 PrimaryFactor
	{
		$$ = append($1.([]Factor1), $2, $3) //TODO 59
	}

Factor11:
	_GE
	{
		$$ = $1 //TODO 60
	}
|	'>'
	{
		$$ = ">" //TODO 61
	}
|	_LE
	{
		$$ = $1 //TODO 62
	}
|	'<'
	{
		$$ = "<" //TODO 63
	}
|	_NEQ
	{
		$$ = $1 //TODO 64
	}
|	_EQ
	{
		$$ = $1 //TODO 65
	}
|	_LIKE
	{
		$$ = "LIKE" //TODO 66
	}

Factor2:
	/* EMPTY */
	{
		$$ = nil //TODO 67
	}
|	Predicate
	{
		$$ = $1 //TODO 68
	}

Field:
	Expression Field1
	{
		$$ = []Field{$1, $2} //TODO 69
	}

Field1:
	/* EMPTY */
	{
		$$ = nil //TODO 70
	}
|	_AS _IDENTIFIER
	{
		$$ = []Field1{"AS", $2} //TODO 71
	}

FieldList:
	Field FieldList1 FieldList2
	{
		$$ = []FieldList{$1, $2, $3} //TODO 72
	}

FieldList1:
	/* EMPTY */
	{
		$$ = []FieldList1(nil) //TODO 73
	}
|	FieldList1 ',' Field
	{
		$$ = append($1.([]FieldList1), ",", $3) //TODO 74
	}

FieldList2:
	/* EMPTY */
	{
		$$ = nil //TODO 75
	}
|	','
	{
		$$ = "," //TODO 76
	}

GroupByClause:
	_GROUPBY ColumnNameList
	{
		$$ = []GroupByClause{"GROUP BY", $2} //TODO 77
	}

Index:
	'[' Expression ']'
	{
		$$ = []Index{"[", $2, "]"} //TODO 78
	}

IndexName:
	_IDENTIFIER
	{
		$$ = $1 //TODO 79
	}

InsertIntoStmt:
	_INSERT _INTO TableName InsertIntoStmt1 InsertIntoStmt2
	{
		$$ = []InsertIntoStmt{"INSERT", "INTO", $3, $4, $5} //TODO 80
	}

InsertIntoStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 81
	}
|	'(' ColumnNameList ')'
	{
		$$ = []InsertIntoStmt1{"(", $2, ")"} //TODO 82
	}

InsertIntoStmt2:
	Values
	{
		$$ = $1 //TODO 83
	}
|	SelectStmt
	{
		$$ = $1 //TODO 84
	}

Limit:
	_LIMIT Expression
	{
		$$ = []Limit{"Limit", $2} //TODO 85
	}

Literal:
	_FALSE
	{
		$$ = "FALSE" //TODO 86
	}
|	_NULL
	{
		$$ = "NULL" //TODO 87
	}
|	_TRUE
	{
		$$ = "TRUE" //TODO 88
	}
|	_FLOAT_LIT
	{
		$$ = $1 //TODO 89
	}
|	_IMAGINARY_LIT
	{
		$$ = $1 //TODO 90
	}
|	_INT_LIT
	{
		$$ = $1 //TODO 91
	}
|	_RUNE_LIT
	{
		$$ = $1 //TODO 92
	}
|	_STRING_LIT
	{
		$$ = $1 //TODO 93
	}
|	_QL_PARAMETER
	{
		$$ = $1 //TODO 94
	}

Offset:
	_OFFSET Expression
	{
		$$ = []Offset{"OFFSET", $2} //TODO 95
	}

Operand:
	Literal
	{
		$$ = $1 //TODO 96
	}
|	QualifiedIdent
	{
		$$ = $1 //TODO 97
	}
|	'(' Expression ')'
	{
		$$ = []Operand{"(", $2, ")"} //TODO 98
	}

OrderBy:
	_ORDER _BY ExpressionList OrderBy1
	{
		$$ = []OrderBy{"ORDER", "BY", $3, $4} //TODO 99
	}

OrderBy1:
	/* EMPTY */
	{
		$$ = nil //TODO 100
	}
|	OrderBy11
	{
		$$ = $1 //TODO 101
	}

OrderBy11:
	_ASC
	{
		$$ = "ASC" //TODO 102
	}
|	_DESC
	{
		$$ = "DESC" //TODO 103
	}

Predicate:
	Predicate1
	{
		$$ = $1 //TODO 104
	}

Predicate1:
	Predicate11 Predicate12
	{
		$$ = []Predicate1{$1, $2} //TODO 105
	}
|	_IS Predicate13 _NULL
	{
		$$ = []Predicate1{"IS", $2, "NULL"} //TODO 106
	}

Predicate11:
	/* EMPTY */
	{
		$$ = nil //TODO 107
	}
|	_NOT
	{
		$$ = "NOT" //TODO 108
	}

Predicate12:
	_IN '(' ExpressionList ')'
	{
		$$ = []Predicate12{"IN", "(", $3, ")"} //TODO 109
	}
|	_IN '(' SelectStmt ')'
	{
		$$ = []Predicate12{"IN", "(", $3, ")"} //TODO 110
	}
|	_BETWEEN PrimaryFactor _AND PrimaryFactor
	{
		$$ = []Predicate12{"BETWEEN", $2, "AND", $4} //TODO 111
	}

Predicate13:
	/* EMPTY */
	{
		$$ = nil //TODO 112
	}
|	_NOT
	{
		$$ = "NOT" //TODO 113
	}

PrimaryExpression:
	Operand
	{
		$$ = $1 //TODO 114
	}
|	Conversion
	{
		$$ = $1 //TODO 115
	}
|	PrimaryExpression Index
	{
		$$ = []PrimaryExpression{$1, $2} //TODO 116
	}
|	PrimaryExpression Slice
	{
		$$ = []PrimaryExpression{$1, $2} //TODO 117
	}
|	PrimaryExpression Call
	{
		$$ = []PrimaryExpression{$1, $2} //TODO 118
	}

PrimaryFactor:
	PrimaryTerm PrimaryFactor1
	{
		$$ = []PrimaryFactor{$1, $2} //TODO 119
	}

PrimaryFactor1:
	/* EMPTY */
	{
		$$ = []PrimaryFactor1(nil) //TODO 120
	}
|	PrimaryFactor1 PrimaryFactor11 PrimaryTerm
	{
		$$ = append($1.([]PrimaryFactor1), $2, $3) //TODO 121
	}

PrimaryFactor11:
	'^'
	{
		$$ = "^" //TODO 122
	}
|	'|'
	{
		$$ = "|" //TODO 123
	}
|	'-'
	{
		$$ = "-" //TODO 124
	}
|	'+'
	{
		$$ = "+" //TODO 125
	}

PrimaryTerm:
	UnaryExpr PrimaryTerm1
	{
		$$ = []PrimaryTerm{$1, $2} //TODO 126
	}

PrimaryTerm1:
	/* EMPTY */
	{
		$$ = []PrimaryTerm1(nil) //TODO 127
	}
|	PrimaryTerm1 PrimaryTerm11 UnaryExpr
	{
		$$ = append($1.([]PrimaryTerm1), $2, $3) //TODO 128
	}

PrimaryTerm11:
	_ANDNOT
	{
		$$ = $1 //TODO 129
	}
|	'&'
	{
		$$ = "&" //TODO 130
	}
|	_LSH
	{
		$$ = $1 //TODO 131
	}
|	_RSH
	{
		$$ = $1 //TODO 132
	}
|	'%'
	{
		$$ = "%" //TODO 133
	}
|	'/'
	{
		$$ = "/" //TODO 134
	}
|	'*'
	{
		$$ = "*" //TODO 135
	}

QualifiedIdent:
	_IDENTIFIER QualifiedIdent1
	{
		$$ = []QualifiedIdent{$1, $2} //TODO 136
	}

QualifiedIdent1:
	/* EMPTY */
	{
		$$ = nil //TODO 137
	}
|	'.' _IDENTIFIER
	{
		$$ = []QualifiedIdent1{".", $2} //TODO 138
	}

RecordSet:
	RecordSet1 RecordSet2
	{
		$$ = []RecordSet{$1, $2} //TODO 139
	}

RecordSet1:
	TableName
	{
		$$ = $1 //TODO 140
	}
|	'(' SelectStmt RecordSet11 ')'
	{
		$$ = []RecordSet1{"(", $2, $3, ")"} //TODO 141
	}

RecordSet11:
	/* EMPTY */
	{
		$$ = nil //TODO 142
	}
|	';'
	{
		$$ = ";" //TODO 143
	}

RecordSet2:
	/* EMPTY */
	{
		$$ = nil //TODO 144
	}
|	_AS _IDENTIFIER
	{
		$$ = []RecordSet2{"AS", $2} //TODO 145
	}

RecordSetList:
	RecordSet RecordSetList1 RecordSetList2
	{
		$$ = []RecordSetList{$1, $2, $3} //TODO 146
	}

RecordSetList1:
	/* EMPTY */
	{
		$$ = []RecordSetList1(nil) //TODO 147
	}
|	RecordSetList1 ',' RecordSet
	{
		$$ = append($1.([]RecordSetList1), ",", $3) //TODO 148
	}

RecordSetList2:
	/* EMPTY */
	{
		$$ = nil //TODO 149
	}
|	','
	{
		$$ = "," //TODO 150
	}

RollbackStmt:
	_ROLLBACK
	{
		$$ = "ROLLBACK" //TODO 151
	}

SelectStmt:
	_SELECT SelectStmt1 SelectStmt2 _FROM RecordSetList SelectStmt3 SelectStmt4 SelectStmt5 SelectStmt6 SelectStmt7
	{
		$$ = []SelectStmt{"SELECT", $2, $3, "FROM", $5, $6, $7, $8, $9, $10} //TODO 152
	}

SelectStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 153
	}
|	_DISTINCT
	{
		$$ = "DISTINCT" //TODO 154
	}

SelectStmt2:
	'*'
	{
		$$ = "*" //TODO 155
	}
|	FieldList
	{
		$$ = $1 //TODO 156
	}

SelectStmt3:
	/* EMPTY */
	{
		$$ = nil //TODO 157
	}
|	WhereClause
	{
		$$ = $1 //TODO 158
	}

SelectStmt4:
	/* EMPTY */
	{
		$$ = nil //TODO 159
	}
|	GroupByClause
	{
		$$ = $1 //TODO 160
	}

SelectStmt5:
	/* EMPTY */
	{
		$$ = nil //TODO 161
	}
|	OrderBy
	{
		$$ = $1 //TODO 162
	}

SelectStmt6:
	/* EMPTY */
	{
		$$ = nil //TODO 163
	}
|	Limit
	{
		$$ = $1 //TODO 164
	}

SelectStmt7:
	/* EMPTY */
	{
		$$ = nil //TODO 165
	}
|	Offset
	{
		$$ = $1 //TODO 166
	}

Slice:
	'[' Slice1 ':' Slice2 ']'
	{
		$$ = []Slice{"[", $2, ":", $4, "]"} //TODO 167
	}

Slice1:
	/* EMPTY */
	{
		$$ = nil //TODO 168
	}
|	Expression
	{
		$$ = $1 //TODO 169
	}

Slice2:
	/* EMPTY */
	{
		$$ = nil //TODO 170
	}
|	Expression
	{
		$$ = $1 //TODO 171
	}

Start:
	StatementList
	{
		_parserResult = $1 //TODO 172
	}

Statement:
	EmptyStmt
	{
		$$ = $1 //TODO 173
	}
|	AlterTableStmt
	{
		$$ = $1 //TODO 174
	}
|	BeginTransactionStmt
	{
		$$ = $1 //TODO 175
	}
|	CommitStmt
	{
		$$ = $1 //TODO 176
	}
|	CreateIndexStmt
	{
		$$ = $1 //TODO 177
	}
|	CreateTableStmt
	{
		$$ = $1 //TODO 178
	}
|	DeleteFromStmt
	{
		$$ = $1 //TODO 179
	}
|	DropIndexStmt
	{
		$$ = $1 //TODO 180
	}
|	DropTableStmt
	{
		$$ = $1 //TODO 181
	}
|	InsertIntoStmt
	{
		$$ = $1 //TODO 182
	}
|	RollbackStmt
	{
		$$ = $1 //TODO 183
	}
|	SelectStmt
	{
		$$ = $1 //TODO 184
	}
|	TruncateTableStmt
	{
		$$ = $1 //TODO 185
	}
|	UpdateStmt
	{
		$$ = $1 //TODO 186
	}

StatementList:
	Statement StatementList1
	{
		$$ = []StatementList{$1, $2} //TODO 187
	}

StatementList1:
	/* EMPTY */
	{
		$$ = []StatementList1(nil) //TODO 188
	}
|	StatementList1 ';' Statement
	{
		$$ = append($1.([]StatementList1), ";", $3) //TODO 189
	}

TableName:
	_IDENTIFIER
	{
		$$ = $1 //TODO 190
	}

Term:
	Factor Term1
	{
		$$ = []Term{$1, $2} //TODO 191
	}

Term1:
	/* EMPTY */
	{
		$$ = []Term1(nil) //TODO 192
	}
|	Term1 Term11 Factor
	{
		$$ = append($1.([]Term1), $2, $3) //TODO 193
	}

Term11:
	_ANDAND
	{
		$$ = $1 //TODO 194
	}
|	_AND
	{
		$$ = "AND" //TODO 195
	}

TruncateTableStmt:
	_TRUNCATE _TABLE TableName
	{
		$$ = []TruncateTableStmt{"TRUNCATE", "TABLE", $3} //TODO 196
	}

Type:
	_BIGINT
	{
		$$ = "bigint" //TODO 197
	}
|	_BIGRAT
	{
		$$ = "bigrat" //TODO 198
	}
|	_BLOB
	{
		$$ = "blob" //TODO 199
	}
|	_BOOL
	{
		$$ = "bool" //TODO 200
	}
|	_BYTE
	{
		$$ = "byte" //TODO 201
	}
|	_COMPLEX128
	{
		$$ = "complex128" //TODO 202
	}
|	_COMPLEX64
	{
		$$ = "complex64" //TODO 203
	}
|	_DURATION
	{
		$$ = "duration" //TODO 204
	}
|	_FLOAT
	{
		$$ = "float" //TODO 205
	}
|	_FLOAT32
	{
		$$ = "float32" //TODO 206
	}
|	_FLOAT64
	{
		$$ = "float64" //TODO 207
	}
|	_INT
	{
		$$ = "int" //TODO 208
	}
|	_INT16
	{
		$$ = "int16" //TODO 209
	}
|	_INT32
	{
		$$ = "int32" //TODO 210
	}
|	_INT64
	{
		$$ = "int64" //TODO 211
	}
|	_INT8
	{
		$$ = "int8" //TODO 212
	}
|	_RUNE
	{
		$$ = "rune" //TODO 213
	}
|	_STRING
	{
		$$ = "string" //TODO 214
	}
|	_TIME
	{
		$$ = "time" //TODO 215
	}
|	_UINT
	{
		$$ = "uint" //TODO 216
	}
|	_UINT16
	{
		$$ = "uint16" //TODO 217
	}
|	_UINT32
	{
		$$ = "uint32" //TODO 218
	}
|	_UINT64
	{
		$$ = "uint64" //TODO 219
	}
|	_UINT8
	{
		$$ = "uint8" //TODO 220
	}

UnaryExpr:
	UnaryExpr1 PrimaryExpression
	{
		$$ = []UnaryExpr{$1, $2} //TODO 221
	}

UnaryExpr1:
	/* EMPTY */
	{
		$$ = nil //TODO 222
	}
|	UnaryExpr11
	{
		$$ = $1 //TODO 223
	}

UnaryExpr11:
	'^'
	{
		$$ = "^" //TODO 224
	}
|	'!'
	{
		$$ = "!" //TODO 225
	}
|	'-'
	{
		$$ = "-" //TODO 226
	}
|	'+'
	{
		$$ = "+" //TODO 227
	}

UpdateStmt:
	_UPDATE TableName UpdateStmt1 AssignmentList UpdateStmt2
	{
		$$ = []UpdateStmt{"UPDATE", $2, $3, $4, $5} //TODO 228
	}

UpdateStmt1:
	/* EMPTY */
	{
		$$ = nil //TODO 229
	}
|	_SET
	{
		$$ = "SET" //TODO 230
	}

UpdateStmt2:
	/* EMPTY */
	{
		$$ = nil //TODO 231
	}
|	WhereClause
	{
		$$ = $1 //TODO 232
	}

Values:
	_VALUES '(' ExpressionList ')' Values1 Values2
	{
		$$ = []Values{"VALUES", "(", $3, ")", $5, $6} //TODO 233
	}

Values1:
	/* EMPTY */
	{
		$$ = []Values1(nil) //TODO 234
	}
|	Values1 ',' '(' ExpressionList ')'
	{
		$$ = append($1.([]Values1), ",", "(", $4, ")") //TODO 235
	}

Values2:
	/* EMPTY */
	{
		$$ = nil //TODO 236
	}
|	','
	{
		$$ = "," //TODO 237
	}

WhereClause:
	_WHERE Expression
	{
		$$ = []WhereClause{"WHERE", $2} //TODO 238
	}

%%

//TODO remove demo stuff below

var _parserResult interface{}

type (
	AlterTableStmt interface{}
	AlterTableStmt1 interface{}
	Assignment interface{}
	AssignmentList interface{}
	AssignmentList1 interface{}
	AssignmentList2 interface{}
	BeginTransactionStmt interface{}
	Call interface{}
	Call1 interface{}
	ColumnDef interface{}
	ColumnName interface{}
	ColumnNameList interface{}
	ColumnNameList1 interface{}
	ColumnNameList2 interface{}
	CommitStmt interface{}
	Conversion interface{}
	CreateIndexStmt interface{}
	CreateIndexStmt1 interface{}
	CreateIndexStmt2 interface{}
	CreateIndexStmt3 interface{}
	CreateTableStmt interface{}
	CreateTableStmt1 interface{}
	CreateTableStmt2 interface{}
	CreateTableStmt3 interface{}
	DeleteFromStmt interface{}
	DeleteFromStmt1 interface{}
	DropIndexStmt interface{}
	DropIndexStmt1 interface{}
	DropTableStmt interface{}
	DropTableStmt1 interface{}
	EmptyStmt interface{}
	Expression interface{}
	Expression1 interface{}
	Expression11 interface{}
	ExpressionList interface{}
	ExpressionList1 interface{}
	ExpressionList2 interface{}
	Factor interface{}
	Factor1 interface{}
	Factor11 interface{}
	Factor2 interface{}
	Field interface{}
	Field1 interface{}
	FieldList interface{}
	FieldList1 interface{}
	FieldList2 interface{}
	GroupByClause interface{}
	Index interface{}
	IndexName interface{}
	InsertIntoStmt interface{}
	InsertIntoStmt1 interface{}
	InsertIntoStmt2 interface{}
	Limit interface{}
	Literal interface{}
	Offset interface{}
	Operand interface{}
	OrderBy interface{}
	OrderBy1 interface{}
	OrderBy11 interface{}
	Predicate interface{}
	Predicate1 interface{}
	Predicate11 interface{}
	Predicate12 interface{}
	Predicate13 interface{}
	PrimaryExpression interface{}
	PrimaryFactor interface{}
	PrimaryFactor1 interface{}
	PrimaryFactor11 interface{}
	PrimaryTerm interface{}
	PrimaryTerm1 interface{}
	PrimaryTerm11 interface{}
	QualifiedIdent interface{}
	QualifiedIdent1 interface{}
	RecordSet interface{}
	RecordSet1 interface{}
	RecordSet11 interface{}
	RecordSet2 interface{}
	RecordSetList interface{}
	RecordSetList1 interface{}
	RecordSetList2 interface{}
	RollbackStmt interface{}
	SelectStmt interface{}
	SelectStmt1 interface{}
	SelectStmt2 interface{}
	SelectStmt3 interface{}
	SelectStmt4 interface{}
	SelectStmt5 interface{}
	SelectStmt6 interface{}
	SelectStmt7 interface{}
	Slice interface{}
	Slice1 interface{}
	Slice2 interface{}
	Start interface{}
	Statement interface{}
	StatementList interface{}
	StatementList1 interface{}
	TableName interface{}
	Term interface{}
	Term1 interface{}
	Term11 interface{}
	TruncateTableStmt interface{}
	Type interface{}
	UnaryExpr interface{}
	UnaryExpr1 interface{}
	UnaryExpr11 interface{}
	UpdateStmt interface{}
	UpdateStmt1 interface{}
	UpdateStmt2 interface{}
	Values interface{}
	Values1 interface{}
	Values2 interface{}
	WhereClause interface{}
)
	
func _dump() {
	s := fmt.Sprintf("%#v", _parserResult)
	s = strings.Replace(s, "%", "%%", -1)
	s = strings.Replace(s, "{", "{%i\n", -1)
	s = strings.Replace(s, "}", "%u\n}", -1)
	s = strings.Replace(s, ", ", ",\n", -1)
	var buf bytes.Buffer
	strutil.IndentFormatter(&buf, ". ").Format(s)
	buf.WriteString("\n")
	a := strings.Split(buf.String(), "\n")
	for _, v := range a {
		if strings.HasSuffix(v, "(nil)") || strings.HasSuffix(v, "(nil),") {
			continue
		}
	
		fmt.Println(v)
	}
}

// End of demo stuff
