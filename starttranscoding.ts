import { prisma } from "./db";
import axios from "axios";
async function starttranscoding(video_url:string,videoid:string){
    const GITHUB_API_URL = `https://api.github.com/repos/${process.env.GITHUB_USERNAME}/${process.env.GITHUB_REPO_NAME}/dispatches`;
    await axios.post(GITHUB_API_URL,
    {
        event_type:'process_video',
        client_payload:{
            inputUrl:video_url,
            videoId:videoid,
        }
    },
    {
        headers:{
            'Authorization': `Bearer ${process.env.GITHUB_PAT}`,
            'Accept': 'application/vnd.github.v3+json'
        }
    })

    await prisma.uploads.update({
        where:{
            id:videoid
        },
        data:{
            status:"PROCESSING"
        }
    })
    console.log({message:"status upadated",videoid:videoid});

}
export default starttranscoding;
