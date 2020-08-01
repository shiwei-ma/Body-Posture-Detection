`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:56:53
// Design Name: 
// Module Name: cos_table
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module	cos_table
(
	input					clk,
	input					rst_n,
	
	input				[9:0]	angle,
	
	output	reg	signed	[9:0]	cos_value

);


always@(*)
begin
	case(angle)
		0	:	 cos_value	=	256	;	
		1	:	 cos_value	=	255	;	
		2	:	 cos_value	=	255	;	
		3	:	 cos_value	=	255	;
		4	:	 cos_value	=	255	;
		5	:	 cos_value	=	255	;
		6	:	 cos_value	=	254	;
		7	:	 cos_value	=	254	;
		8	:	 cos_value	=	253	;
		9	:	 cos_value	=	252	;
		10	:	 cos_value	=	252	;
		11	:	 cos_value	=	251	;
		12	:	 cos_value	=	250	;
		13	:	 cos_value	=	249	;
		14	:	 cos_value	=	248	;
		15	:	 cos_value	=	247	;
		16	:	 cos_value	=	246	;
		17	:	 cos_value	=	244	;
		18	:	 cos_value	=	243	;
		19	:	 cos_value	=	242	;
		20	:	 cos_value	=	240	;
		21	:	 cos_value	=	238	;
		22	:	 cos_value	=	237	;
		23	:	 cos_value	=	235	;
		24	:	 cos_value	=	233	;
		25	:	 cos_value	=	232	;
		26	:	 cos_value	=	230	;
		27	:	 cos_value	=	228	;
		28	:	 cos_value	=	226	;
		29	:	 cos_value	=	223	;
		30	:	 cos_value	=	221	;
		31	:	 cos_value	=	219	;
		32	:	 cos_value	=	217	;
		33	:	 cos_value	=	214	;
		34	:	 cos_value	=	212	;
		35	:	 cos_value	=	209	;
		36	:	 cos_value	=	207	;
		37	:	 cos_value	=	204	;
		38	:	 cos_value	=	201	;
		39	:	 cos_value	=	198	;
		40	:	 cos_value	=	196	;
		41	:	 cos_value	=	193	;
		42	:	 cos_value	=	190	;
		43	:	 cos_value	=	187	;
		44	:	 cos_value	=	184	;
		45	:	 cos_value	=	181	;
		46	:	 cos_value	=	177	;
		47	:	 cos_value	=	174	;
		48	:	 cos_value	=	171	;
		49	:	 cos_value	=	167	;
		50	:	 cos_value	=	164	;
		51	:	 cos_value	=	161	;
		52	:	 cos_value	=	157	;
		53	:	 cos_value	=	154	;
		54	:	 cos_value	=	150	;
		55	:	 cos_value	=	146	;
		56	:	 cos_value	=	143	;
		57	:	 cos_value	=	139	;
		58	:	 cos_value	=	135	;
		59	:	 cos_value	=	131	;
		60	:	 cos_value	=	128	;
		61	:	 cos_value	=	124	;
		62	:	 cos_value	=	120	;
		63	:	 cos_value	=	116	;
		64	:	 cos_value	=	112	;
		65	:	 cos_value	=	108	;
		66	:	 cos_value	=	104	;
		67	:	 cos_value	=	100	;
		68	:	 cos_value	=	95	;
		69	:	 cos_value	=	91	;
		70	:	 cos_value	=	87	;
		71	:	 cos_value	=	83	;
		72	:	 cos_value	=	79	;
		73	:	 cos_value	=	74	;
		74	:	 cos_value	=	70	;
		75	:	 cos_value	=	66	;
		76	:	 cos_value	=	61	;
		77	:	 cos_value	=	57	;
		78	:	 cos_value	=	53	;
		79	:	 cos_value	=	48	;
		80	:	 cos_value	=	44	;
		81	:	 cos_value	=	40	;
		82	:	 cos_value	=	35	;
		83	:	 cos_value	=	31	;
		84	:	 cos_value	=	26	;
		85	:	 cos_value	=	22	;
		86	:	 cos_value	=	17	;
		87	:	 cos_value	=	13	;
		88	:	 cos_value	=	8	;
		89	:	 cos_value	=	4	;
		90	:	 cos_value	=	0	;
		91	:	 cos_value	=	-4	;
		92	:	 cos_value	=	-8	;
		93	:	 cos_value	=	-13	;
		94	:	 cos_value	=	-17	;
		95	:	 cos_value	=	-22	;
		96	:	 cos_value	=	-26	;
		97	:	 cos_value	=	-31	;
		98	:	 cos_value	=	-35	;
		99	:	 cos_value	=	-40	;
		100	:	 cos_value	=	-44	;
		101	:	 cos_value	=	-48	;
		102	:	 cos_value	=	-53	;
		103	:	 cos_value	=	-57	;
		104	:	 cos_value	=	-61	;
		105	:	 cos_value	=	-66	;
		106	:	 cos_value	=	-70	;
		107	:	 cos_value	=	-74	;
		108	:	 cos_value	=	-79	;
		109	:	 cos_value	=	-83	;
		110	:	 cos_value	=	-87	;
		111	:	 cos_value	=	-91	;
		112	:	 cos_value	=	-95	;
		113	:	 cos_value	=	-100	;
		114	:	 cos_value	=	-104	;
		115	:	 cos_value	=	-108	;
		116	:	 cos_value	=	-112	;
		117	:	 cos_value	=	-116	;
		118	:	 cos_value	=	-120	;
		119	:	 cos_value	=	-124	;
		120	:	 cos_value	=	-127	;
		121	:	 cos_value	=	-131	;
		122	:	 cos_value	=	-135	;
		123	:	 cos_value	=	-139	;
		124	:	 cos_value	=	-143	;
		125	:	 cos_value	=	-146	;
		126	:	 cos_value	=	-150	;
		127	:	 cos_value	=	-154	;
		128	:	 cos_value	=	-157	;
		129	:	 cos_value	=	-161	;
		130	:	 cos_value	=	-164	;
		131	:	 cos_value	=	-167	;
		132	:	 cos_value	=	-171	;
		133	:	 cos_value	=	-174	;
		134	:	 cos_value	=	-177	;
		135	:	 cos_value	=	-181	;
		136	:	 cos_value	=	-184	;
		137	:	 cos_value	=	-187	;
		138	:	 cos_value	=	-190	;
		139	:	 cos_value	=	-193	;
		140	:	 cos_value	=	-196	;
		141	:	 cos_value	=	-198	;
		142	:	 cos_value	=	-201	;
		143	:	 cos_value	=	-204	;
		144	:	 cos_value	=	-207	;
		145	:	 cos_value	=	-209	;
		146	:	 cos_value	=	-212	;
		147	:	 cos_value	=	-214	;
		148	:	 cos_value	=	-217	;
		149	:	 cos_value	=	-219	;
		150	:	 cos_value	=	-221	;
		151	:	 cos_value	=	-223	;
		152	:	 cos_value	=	-226	;
		153	:	 cos_value	=	-228	;
		154	:	 cos_value	=	-230	;
		155	:	 cos_value	=	-232	;
		156	:	 cos_value	=	-233	;
		157	:	 cos_value	=	-235	;
		158	:	 cos_value	=	-237	;
		159	:	 cos_value	=	-238	;
		160	:	 cos_value	=	-240	;
		161	:	 cos_value	=	-242	;
		162	:	 cos_value	=	-243	;
		163	:	 cos_value	=	-244	;
		164	:	 cos_value	=	-246	;
		165	:	 cos_value	=	-247	;
		166	:	 cos_value	=	-248	;
		167	:	 cos_value	=	-249	;
		168	:	 cos_value	=	-250	;
		169	:	 cos_value	=	-251	;
		170	:	 cos_value	=	-252	;
		171	:	 cos_value	=	-252	;
		172	:	 cos_value	=	-253	;
		173	:	 cos_value	=	-254	;
		174	:	 cos_value	=	-254	;
		175	:	 cos_value	=	-255	;
		176	:	 cos_value	=	-255	;
		177	:	 cos_value	=	-255	;	
		178	:	 cos_value	=	-255	;	
		179	:	 cos_value	=	-255	;	
		180	:	 cos_value	=	-256	;	
		181	:	 cos_value	=	-255	;	
		182	:	 cos_value	=	-255	;	
		183	:	 cos_value	=	-255	;
		184	:	 cos_value	=	-255	;
		185	:	 cos_value	=	-255	;
		186	:	 cos_value	=	-254	;
		187	:	 cos_value	=	-254	;
		188	:	 cos_value	=	-253	;
		189	:	 cos_value	=	-252	;
		190	:	 cos_value	=	-252	;
		191	:	 cos_value	=	-251	;
		192	:	 cos_value	=	-250	;
		193	:	 cos_value	=	-249	;
		194	:	 cos_value	=	-248	;
		195	:	 cos_value	=	-247	;
		196	:	 cos_value	=	-246	;
		197	:	 cos_value	=	-244	;
		198	:	 cos_value	=	-243	;
		199	:	 cos_value	=	-242	;
		200	:	 cos_value	=	-240	;
		201	:	 cos_value	=	-238	;
		202	:	 cos_value	=	-237	;
		203	:	 cos_value	=	-235	;
		204	:	 cos_value	=	-233	;
		205	:	 cos_value	=	-232	;
		206	:	 cos_value	=	-230	;
		207	:	 cos_value	=	-228	;
		208	:	 cos_value	=	-226	;
		209	:	 cos_value	=	-223	;
		210	:	 cos_value	=	-221	;
		211	:	 cos_value	=	-219	;
		212	:	 cos_value	=	-217	;
		213	:	 cos_value	=	-214	;
		214	:	 cos_value	=	-212	;
		215	:	 cos_value	=	-209	;
		216	:	 cos_value	=	-207	;
		217	:	 cos_value	=	-204	;
		218	:	 cos_value	=	-201	;
		219	:	 cos_value	=	-198	;
		220	:	 cos_value	=	-196	;
		221	:	 cos_value	=	-193	;
		222	:	 cos_value	=	-190	;
		223	:	 cos_value	=	-187	;
		224	:	 cos_value	=	-184	;
		225	:	 cos_value	=	-181	;
		226	:	 cos_value	=	-177	;
		227	:	 cos_value	=	-174	;
		228	:	 cos_value	=	-171	;
		229	:	 cos_value	=	-167	;
		230	:	 cos_value	=	-164	;
		231	:	 cos_value	=	-161	;
		232	:	 cos_value	=	-157	;
		233	:	 cos_value	=	-154	;
		234	:	 cos_value	=	-150	;
		235	:	 cos_value	=	-146	;
		236	:	 cos_value	=	-143	;
		237	:	 cos_value	=	-139	;
		238	:	 cos_value	=	-135	;
		239	:	 cos_value	=	-131	;
		240	:	 cos_value	=	-127	;
		241	:	 cos_value	=	-124	;
		242	:	 cos_value	=	-120	;
		243	:	 cos_value	=	-116	;
		244	:	 cos_value	=	-112	;
		245	:	 cos_value	=	-108	;
		246	:	 cos_value	=	-104	;
		247	:	 cos_value	=	-100	;
		248	:	 cos_value	=	-95	;
		249	:	 cos_value	=	-91	;
		250	:	 cos_value	=	-87	;
		251	:	 cos_value	=	-83	;
		252	:	 cos_value	=	-79	;
		253	:	 cos_value	=	-74	;
		254	:	 cos_value	=	-70	;
		255	:	 cos_value	=	-66	;
		256	:	 cos_value	=	-61	;
		257	:	 cos_value	=	-57	;
		258	:	 cos_value	=	-53	;
		259	:	 cos_value	=	-48	;
		260	:	 cos_value	=	-44	;
		261	:	 cos_value	=	-40	;
		262	:	 cos_value	=	-35	;
		263	:	 cos_value	=	-31	;
		264	:	 cos_value	=	-26	;
		265	:	 cos_value	=	-22	;
		266	:	 cos_value	=	-17	;
		267	:	 cos_value	=	-13	;
		268	:	 cos_value	=	-8	;
		269	:	 cos_value	=	-4	;
		270	:	 cos_value	=	0	;
		271	:	 cos_value	=	4	;
		272	:	 cos_value	=	8	;
		273	:	 cos_value	=	13	;
		274	:	 cos_value	=	17	;
		275	:	 cos_value	=	22	;
		276	:	 cos_value	=	26	;
		277	:	 cos_value	=	31	;
		278	:	 cos_value	=	35	;
		279	:	 cos_value	=	40	;
		280	:	 cos_value	=	44	;
		281	:	 cos_value	=	48	;
		282	:	 cos_value	=	53	;
		283	:	 cos_value	=	57	;
		284	:	 cos_value	=	61	;
		285	:	 cos_value	=	66	;
		286	:	 cos_value	=	70	;
		287	:	 cos_value	=	74	;
		288	:	 cos_value	=	79	;
		289	:	 cos_value	=	83	;
		290	:	 cos_value	=	87	;
		291	:	 cos_value	=	91	;
		292	:	 cos_value	=	95	;
		293	:	 cos_value	=	100	;
		294	:	 cos_value	=	104	;
		295	:	 cos_value	=	108	;
		296	:	 cos_value	=	112	;
		297	:	 cos_value	=	116	;
		298	:	 cos_value	=	120	;
		299	:	 cos_value	=	124	;
		300	:	 cos_value	=	128	;
		301	:	 cos_value	=	131	;
		302	:	 cos_value	=	135	;
		303	:	 cos_value	=	139	;
		304	:	 cos_value	=	143	;
		305	:	 cos_value	=	146	;
		306	:	 cos_value	=	150	;
		307	:	 cos_value	=	154	;
		308	:	 cos_value	=	157	;
		309	:	 cos_value	=	161	;
		310	:	 cos_value	=	164	;
		311	:	 cos_value	=	167	;
		312	:	 cos_value	=	171	;
		313	:	 cos_value	=	174	;
		314	:	 cos_value	=	177	;
		315	:	 cos_value	=	181	;
		316	:	 cos_value	=	184	;
		317	:	 cos_value	=	187	;
		318	:	 cos_value	=	190	;
		319	:	 cos_value	=	193	;
		320	:	 cos_value	=	196	;
		321	:	 cos_value	=	198	;
		322	:	 cos_value	=	201	;
		323	:	 cos_value	=	204	;
		324	:	 cos_value	=	207	;
		325	:	 cos_value	=	209	;
		326	:	 cos_value	=	212	;
		327	:	 cos_value	=	214	;
		328	:	 cos_value	=	217	;
		329	:	 cos_value	=	219	;
		330	:	 cos_value	=	221	;
		331	:	 cos_value	=	223	;
		332	:	 cos_value	=	226	;
		333	:	 cos_value	=	228	;
		334	:	 cos_value	=	230	;
		335	:	 cos_value	=	232	;
		336	:	 cos_value	=	233	;
		337	:	 cos_value	=	235	;
		338	:	 cos_value	=	237	;
		339	:	 cos_value	=	238	;
		340	:	 cos_value	=	240	;
		341	:	 cos_value	=	242	;
		342	:	 cos_value	=	243	;
		343	:	 cos_value	=	244	;
		344	:	 cos_value	=	246	;
		345	:	 cos_value	=	247	;
		346	:	 cos_value	=	248	;
		347	:	 cos_value	=	249	;
		348	:	 cos_value	=	250	;
		349	:	 cos_value	=	251	;
		350	:	 cos_value	=	252	;
		351	:	 cos_value	=	252	;
		352	:	 cos_value	=	253	;
		353	:	 cos_value	=	254	;
		354	:	 cos_value	=	254	;
		355	:	 cos_value	=	255	;
		356	:	 cos_value	=	255	;
		357	:	 cos_value	=	255	;
		358	:	 cos_value	=	255	;
		359	:	 cos_value	=	255	;
		default	:cos_value	=	256	;	
	endcase      
end              
                 
endmodule	     
                
             
