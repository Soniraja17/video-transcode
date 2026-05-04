import jwt from "jsonwebtoken";
import { Request, Response, NextFunction } from "express";

function authmiddleware(req: Request, res: Response, next: NextFunction) {
    const token = req.headers.token; // 👈 type cast

    if (!token) {
        return res.status(400).json({ message: "provide token" });
    }

    try {
        const validtoken = jwt.verify(token, "SECRECT"); // 👈 cast

        if (!validtoken.userid) {
            return res.status(400).json({ message: "token is not valid" });
        } else {
            (req as any).userid = validtoken.userid; // 👈 attach safely
            next();
        }
    } catch (err) {
        return res.status(400).json({ message: "invalid token" });
    }
}

export { authmiddleware };