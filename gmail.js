const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL,
        pass: process.env.PASS
    }
});

const FROM = 'accredian@gmail.com'


const refereeEmail = (referee, referrer, courseName) => {
    const text = `
    Hi ${referee.name},
    ${referrer.name} has referred you to the course ${courseName}.
    Referral code = ${referrer.referralCode}
    `

    const subject = `Accredian referral for ${courseName}`

    return {
        from: FROM,
        to: referee.email,
        subject,
        text
    }
}

const referrerEmail = (referee, referrer, courseName) => {
    const text = `
    Hi ${referrer.name},
    You have referred ${referee.name} to the course ${courseName}.
    Referral code = ${referrer.referralCode}
    `

    const subject = `Accredian referral for ${courseName}`

    return {
        from: FROM,
        to: referrer.email,
        subject,
        text
    }
}

async function sendMail(referee, referrer, courseName) {
    try {
        const mailOptions = refereeEmail(referee, referrer, courseName)
        const mailOptions2 = referrerEmail(referee, referrer, courseName)

        await Promise.all([
            transporter.sendMail(mailOptions),
            transporter.sendMail(mailOptions2)
        ])
        console.log('Mail sent');
    } catch (error) {
        console.log(error)
    }
}

module.exports = {
    sendMail
}


