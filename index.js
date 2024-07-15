const express = require('express');
const { PrismaClient } = require('@prisma/client');
const { sendMail } = require('./gmail');

const prisma = new PrismaClient();
const app = express();

app.use(express.json());



app.get("/", (req, res) => {
    res.send({
        message: "Welcome to Accredian assignment backend",
        name: "Aditya raj",
        linkedIn: "https://linkedin.com/in/rayzr"
    })
})

app.post("/createReferral", async (req, res) => {
    const { referrerName, referrerEmail, refereeName, refereeEmail, courseName } = req.body;

    if (!referrerName || !referrerEmail || !refereeName || !refereeEmail || !courseName) {
        return res.status(400).json({ message: "All fields are required" });
    }

    if (referrerEmail === refereeEmail) {
        return res.status(400).json({ message: "Referrer and referee email cannot be same" });
    }

    if (referrerName === refereeName) {
        return res.status(400).json({ message: "Referrer and referee name cannot be same" });
    }

    if (refereeName.length > 255 || refereeEmail.length > 255 || referrerName.length > 255 || referrerEmail.length > 255) {
        return res.status(400).json({ message: "Name or email too long" });
    }

    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!regex.test(referrerEmail) || !regex.test(refereeEmail)) {
        return res.status(400).json({ message: "Invalid email" });
    }

    try {
        const referralCode = `${referrerName.slice(0, 3)}@${referrerEmail.split('@')[0]}_${courseName.slice(0, 3)}`;

        const referreral = await prisma.referral.create({
            data: {
                refereeEmail,
                refereeName,
                referrerEmail,
                referrerName,
                courseName,
                referralCode
            }
        })

        setImmediate(() => {
            sendMail({ name: refereeName, email: refereeEmail }, { name: referrerName, email: referrerEmail, referralCode }, courseName).catch(console.error);
        })

        res.status(201).json({
            message: "Referral created successfully",
            referreral
        })

    } catch (error) {
        console.log(error);

        if (error.code === 'P2002') {
            return res.status(400).json({ message: `This course has already being referred by ${referrerEmail} to ${refereeEmail}` });
        }

        res.status(500).json({
            message: "Internal server error please try again later",
        });
    }
})



const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
})