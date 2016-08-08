using System;
using System.Collections.Generic;

namespace Chess.ChessModels
{
    public class Pawn : ChessPiece
    {
        public Pawn()
        {
            Init();
        }

        public Pawn(char color)
        {
            Color = color;
            Init();
        }

        private void Init()
        {
            Piece = "Pawn";
            Symbol = 'P';
            ResetMovement();
        }
        public override void MovePiece(ChessPiece[,] board, int[] start, int[] end)
        {
            board[end[0], end[1]] = board[start[0], start[1]];
            board[start[0], start[1]] = new Space();
        }
        public override bool CheckSquare(ChessPiece[,] board, int[] end)
        {
            return false;
        }
        public override bool CheckMovement(ChessPiece[,] board, int[] start, int[] end)
        {
            ResetMovement();
            return false;
        }
        public override List<int[]> RestrictMovement(ChessPiece[,] board, int[] start)
        {
            List<int[]> available = new List<int[]>();

            return available;
        }
        public override bool IsAvailable(ChessPiece[,] board, int row, int column, int index)
        {
            bool canMove = true;
            if (board[row, column].Color == Color)
            {
                canMove = false;
            }
            if (this.canMove[index] == true)
            {
                this.canMove[index] = canMove;
            }
            return canMove;
        }
        public override void ResetMovement()
        {
            canMove = new bool[] { true, true, true, true, true, true, true, true };
        }
        /****************************/
    }
}
