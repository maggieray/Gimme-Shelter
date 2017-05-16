package problem2;

import java.util.*;

import Jama.Matrix;

import java.io.*;

public class problem2 {
	
	public static char[] dnArray = {' ', 'A', 'C', 'G', 'T'};
	
	public static double rExp(double lam) {
		return Math.log(Math.random())/lam*-1;
	}
	
	public static void main(String[] args) {
		//partA();
		//partB(10, 1, 20, 0.5);
		partC();
	}
	
	//code for 2 part a
	public static void partA() {
		double mean = 0.0;
		for(int i = 0; i < 1000; i++) {
			mean += partA1(1, 10);
		}
		mean = mean/1000;
		System.out.println(mean);
	}
	public static double partA1( int n, int lam) {
		int k = n;
		double t = 0.00;
		
		ArrayList<Node> nodeList = new ArrayList<Node>();
	
		for(int i = 1; i <= k; i++) {
			nodeList.add(new Node("" + i));
			nodeList.get(i-1).setSequence("" + t);
		}
		
		while(k > 1) {
			//get tk
			t += rExp(k*lam);
			Node m = new Node("" + (21-k));
			m.setHeight(t);
			
			//select i and j
			Node i = nodeList.remove((int)(Math.random()*nodeList.size()));
			Node j = nodeList.remove((int)(Math.random()*nodeList.size()));
			m.addChild(i);
			m.addChild(j);
			
			//store m
			nodeList.add(m);
			k--;
		}
		//System.out.println(nodeList.get(0).label);
		System.out.println(nodeList.get(0).getNewick());
		
		return nodeList.get(0).getHeight();
	}

	//code for 2 part b
	public static String[] partB(int n, double lam, int len, double mu) {
		//set up initial sequence
		int[] seq = new int[len];
		
		for(int i = 0; i < len; i++) {
			seq[i] = (int)((Math.random()*4)+1);
			//System.out.print(dnArray[seq[i]]);
		}
		//System.out.println();
		
		ArrayList<Node> nodeList = new ArrayList<Node>();
		
		for(int j = 0; j < n; j++) {
			nodeList.add(new Node(intToString(seq)));
		}
		
		int t = 0;
		while(nodeList.size() > 1) {
			Node m = new Node(intToString(seq));
			m.setHeight(t);
			Node i = nodeList.remove((int)(Math.random()*nodeList.size()));
			Node j = nodeList.remove((int)(Math.random()*nodeList.size()));
			m.addChild(i);
			m.addChild(j);
			//System.out.println("Created node " + m.getLabel() + ", parent to " + i.getLabel() + " and " + j.getLabel());
			nodeList.add(m);
			t++;
		}
		
		//set up root node
		Node a = nodeList.get(0);
		a.setLabel(intToString(seq));
		
		//begin mutation
		mutate(a, mu);
		
		System.out.println(a.getNewick());
		
		String[] sequences = new String[n];
		List<Node> leaves = a.getLeaves();
		for(int i = 0; i < leaves.size(); i++) {
			sequences[i] = leaves.get(i).getLabel();
		}
		return sequences;
	}
	
	public static void mutate(Node me, double mu) {
		int[] sequence = stringToInt(me.getLabel());
		
		//mutate
		for(int s = 0; s < sequence.length; s++) {
			if(Math.random() <= mu) {
				sequence[s] = (int)(Math.random() * 4 + 1);
			}
		}
		
		me.setLabel(intToString(sequence));
		
		if(!me.isLeaf()){
			List<Node> children = me.getChildren();
			for(int i = 0; i < children.size(); i++) {
				children.get(i).setLabel(me.getLabel());
				mutate(children.get(i), mu);
			}
		}
	}
	
	public static double rPoiss(int lam){
	  double t = rExp(lam);
	  double poiss = 0;
	  while (t < 1);
	    poiss += 1;
	    t += rExp(lam);
	  return poiss;
	}
	
	public static String intToString( int[] sequence) {
		String seq = "";
		for(int i = 0; i < sequence.length; i++){
			seq = seq + dnArray[sequence[i]];
		}
		return seq;
	}
	
	public static int[] stringToInt(String sequence) {
		
		int[] seq = new int[sequence.length()];
		
		for(int i = 0; i < sequence.length(); i++) {
			switch(sequence.charAt(i)) {
				case ' ': seq[i] = 0;
					break;
				case 'A': seq[i] = 1;
					break;
				case 'C': seq[i] = 2;
					break;
				case 'G': seq[i] = 3;
					break;
				case 'T': seq[i] = 4;
					break;
			}
		}
		return seq;
	}

	//output from part b
	//((CGGACCCTAAATGCGATTTA:5.0,(ACGGCTCGCAGCTTAAAGGC:2.0,CCATTTAGGACCCCGAGGAT:2.0)CCAATTCGAAGCCCTAGGGC:3.0)CGAATCCTTACTCCTATGGG:4.0,(((TAACAGGTAGCTCTTACACC:1.0,TGATAGGTTTCTCTGAGAGC:1.0)TCACAGGTATTTTTGAAACC:2.0,TAAGTATGTACTTAAGATAG:3.0)TAATAAGGTTCTTGGGAAAG:5.0,((ACTGATCTTGGTCATTAGAG:6.0,CCATCCCTAGCTGTTATAAG:6.0)CCATCCCTTGGTCTTCCAAG:1.0,(TATACAAGTAAATTAACCTC:4.0,ATAGTATGTTGGATCTCGTG:4.0)CTAACAGGTAGTTTGTCCTG:3.0)CAAACAGGTAGTCTGCCAAG:1.0)CCATTCGGTAATCGGGCGAG:1.0)CGATGCCTTATGCGTGAGCT:0.0

	
	//code for 2 part c
	public static void partC() {
		String[] seqA = partB(10, 1, 20, 0.5);
		String[] seqB = seqA;
		
		Matrix dMat = new Matrix(seqA.length, seqB.length);
		
		for(int i = 0; i < seqA.length; i++) {
			for(int j = 0; j < seqB.length; j++) {
				//System.out.println(seqA[i]);
				//System.out.println(seqB[j]);
				dMat.set(i, j, dxy(seqA[i], seqB[j]));
			}
		}
		
		outputMatrix(dMat);
	}
	
	public static double dxy(String seqA, String seqB) {
		//calculate f_xy
		double diffCount = 0.0;
		int[] sequenceA = stringToInt(seqA);
		int[] sequenceB = stringToInt(seqB);
		
		for(int i = 0; i < sequenceA.length; i++) {
			if(sequenceA[i] != sequenceB[i]) {
				diffCount++;
				//System.out.println("difference found!");
			}
		}
		
		//System.out.println("Difference count: " + diffCount);
		double fxy = Math.min(diffCount/seqA.length(), 0.75-(1.0/seqA.length()));
		double d = -0.75 * Math.log( 1.0 - (4.0 * fxy) / 3.0);
		//System.out.println(d);
		return d;
	}
	
	public static void outputMatrix(Matrix m) {
		File output = new File("Q2c output.txt");
		
		try {
		
			PrintWriter writer = new PrintWriter(output);
			
			for(int r = 0; r < m.getRowDimension(); r++) {
			
				writer.print(r + ", ");
				for(int c = 0; c < m.getColumnDimension(); c++) {
				
					writer.print(m.get(r,c));
					
					if(c < m.getColumnDimension()-1) {
						writer.print(", ");
					} else {
						writer.println();
					}
					
				}
			}
			writer.close();
			
		} catch (FileNotFoundException e) {
			System.out.println("Ooops");
		}
	}
}
