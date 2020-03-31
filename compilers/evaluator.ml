module Evaluator = struct

        type types = Bool | Int

        type value = B of bool | I of int

        type expr =
                | Plus of expr * expr
                | Sub of expr * expr
                | Mul of expr * expr
                | Equal of expr * expr
                | And of expr * expr
                | Literal of value

        let prog = Mul ((Plus ((Literal (I 1)), (Literal (I 5)))), (Sub ((Literal (I 3)), (Literal (I 21)))))

        let add v1 v2 = match (v1, v2) with
                | (I i, I i2) -> I (i + i2)
                | _, _ -> failwith "illegal addition operand type"

        let sub v1 v2 = match (v1, v2) with
                | (I i, I i2) -> I (i - i2)
                | _, _ -> failwith "illegal subtraction operand type"

        let mul v1 v2 = match (v1, v2) with
                | (I i, I i2) -> I (i * i2)
                | _, _ -> failwith "illegal subtraction operand type"

        let equal v1 v2 = match (v1, v2) with
                | (I i, I i2) -> B (i == i2)
                | (B b, B b2) -> B (b == b2)
                | _, _ -> failwith "illegal subtraction operand type"

        let _and v1 v2 = match (v1, v2) with
                | (B a, B b) -> B (a && b)
                | _, _ -> failwith "illegal bitwise and operand types"

        let rec eval = function
                | Plus (e1, e2) -> add (eval e1) (eval e2)
                | Sub (e1, e2) -> sub (eval e1) (eval e2)
                | Mul (e1, e2) -> mul (eval e1) (eval e2)
                | Equal (e1, e2) -> equal (eval e1) (eval e2)
                | And (e1, e2) -> _and (eval e1) (eval e2)
                | Literal v -> v

        let prog = Plus ((Literal (I 4)), (Literal (I 10)));;

end
